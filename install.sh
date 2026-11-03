#!/bin/sh
# Link every skill in this repo into each AI harness skill directory.
# Skills cross-reference each other (../<name>/SKILL.md), so all are linked together.

set -u

usage() {
	echo "Usage: $(basename "$0") [skills_dir ...]" >&2
	echo "  With no argument, link into ~/.claude/skills and ~/.gemini/antigravity-cli/skills" >&2
	echo "  when the harness is present." >&2
	exit 1
}

case "${1:-}" in
	-h | --help) usage ;;
esac

REPO_DIR="$(cd "$(dirname "$0")" && pwd -P)"
SKILLS_DIR="${REPO_DIR}/skills"

[ -d "${SKILLS_DIR}" ] || {
	echo "Error: skills directory not found: ${SKILLS_DIR}" >&2
	exit 1
}

detect_targets() {
	if command -v claude > /dev/null 2>&1 || [ -d "${HOME}/.claude" ]; then
		echo "${HOME}/.claude/skills"
	fi
	if command -v agy > /dev/null 2>&1 || [ -d "${HOME}/.gemini" ]; then
		echo "${HOME}/.gemini/antigravity-cli/skills"
	fi
}

# Remove dangling links that point into this repo; leave links from other sources alone.
prune_dangling() {
	for link in "$1"/*; do
		[ -L "${link}" ] && [ ! -e "${link}" ] || continue
		case "$(readlink "${link}")" in
			"${SKILLS_DIR}"/*) rm "${link}" ;;
		esac
	done
}

link_skill() {
	origin="$1"
	target="$2"
	[ -L "${target}" ] && [ "$(readlink "${target}")" = "${origin}" ] && return 0
	# A backup left in a skills directory would load as another skill, so refuse instead.
	if [ -e "${target}" ] || [ -L "${target}" ]; then
		echo "Error: ${target} already exists and is not a link to ${origin}; skipped" >&2
		return 1
	fi
	ln -s "${origin}" "${target}" || {
		echo "Error: failed to link ${origin} to ${target}" >&2
		return 1
	}
}

install_into() {
	target_dir="$1"
	mkdir -p "${target_dir}" || {
		echo "Error: cannot create ${target_dir}" >&2
		return 1
	}
	prune_dangling "${target_dir}"

	conflicts=0
	for skill_dir in "${SKILLS_DIR}"/*/; do
		[ -f "${skill_dir}SKILL.md" ] || continue
		origin="${skill_dir%/}"
		target="${target_dir}/$(basename "${origin}")"
		[ -L "${target}" ] && [ "$(readlink "${target}")" = "${origin}" ] && continue
		if [ -e "${target}" ] || [ -L "${target}" ]; then
			echo "Error: ${target} already exists and is not a link to ${origin}; aborting install" >&2
			conflicts=1
		fi
	done
	[ "${conflicts}" -eq 0 ] || return 1

	status=0
	for skill_dir in "${SKILLS_DIR}"/*/; do
		[ -f "${skill_dir}SKILL.md" ] || continue
		skill_dir="${skill_dir%/}"
		link_skill "${skill_dir}" "${target_dir}/$(basename "${skill_dir}")" || status=1
	done
	return "${status}"
}

if [ "$#" -eq 0 ]; then
	targets="$(detect_targets)"
	[ -n "${targets}" ] || {
		echo "Error: no harness found (~/.claude or ~/.gemini); pass a skills directory" >&2
		exit 1
	}
	set -- ${targets}
fi

result=0
for target_dir in "$@"; do
	install_into "${target_dir}" || result=1
done
exit "${result}"
