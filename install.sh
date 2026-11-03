#!/bin/sh
# Link every skill in this repo into each AI harness skill directory.
# Skills cross-reference each other (../<name>/SKILL.md), so all are linked or none.

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

# Remove the links named in $2 (one per line) from $1.
undo_links() {
	while IFS= read -r undo_name; do
		[ -n "${undo_name}" ] || continue
		rm "$1/${undo_name}" || echo "Error: failed to remove $1/${undo_name}" >&2
	done <<EOF
$2
EOF
}

# Link all skills or none: check every name before linking, and undo this run's
# links if one fails. A taken name is refused rather than backed up, because a
# backup left in a skills directory would load as another skill.
install_into() {
	target_dir="$1"
	mkdir -p "${target_dir}" || {
		echo "Error: cannot create ${target_dir}" >&2
		return 1
	}
	prune_dangling "${target_dir}"

	pending=""
	conflicts=0
	for skill_dir in "${SKILLS_DIR}"/*/; do
		[ -f "${skill_dir}SKILL.md" ] || continue
		name="$(basename "${skill_dir}")"
		origin="${SKILLS_DIR}/${name}"
		target="${target_dir}/${name}"
		[ -L "${target}" ] && [ "$(readlink "${target}")" = "${origin}" ] && continue
		if [ -e "${target}" ] || [ -L "${target}" ]; then
			echo "Error: ${target} already exists and is not a link to ${origin}" >&2
			conflicts=1
			continue
		fi
		pending="${pending}${name}
"
	done
	[ "${conflicts}" -eq 0 ] || {
		echo "Error: nothing linked into ${target_dir}; move the entries above and rerun" >&2
		return 1
	}

	linked=""
	while IFS= read -r name; do
		[ -n "${name}" ] || continue
		ln -s "${SKILLS_DIR}/${name}" "${target_dir}/${name}" || {
			echo "Error: failed to link ${SKILLS_DIR}/${name} to ${target_dir}/${name}; undoing this run" >&2
			undo_links "${target_dir}" "${linked}"
			return 1
		}
		linked="${linked}${name}
"
	done <<EOF
${pending}
EOF
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
