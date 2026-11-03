#!/bin/sh
# Remove the skill links that point into this repo. Links from other sources stay.

set -u

usage() {
	echo "Usage: $(basename "$0") [skills_dir ...]" >&2
	echo "  With no argument, clean ~/.claude/skills and ~/.gemini/antigravity-cli/skills." >&2
	exit 1
}

case "${1:-}" in
	-h | --help) usage ;;
esac

REPO_DIR="$(cd "$(dirname "$0")" && pwd -P)"
SKILLS_DIR="${REPO_DIR}/skills"

[ "$#" -eq 0 ] && set -- "${HOME}/.claude/skills" "${HOME}/.gemini/antigravity-cli/skills"

result=0
for target_dir in "$@"; do
	[ -d "${target_dir}" ] || continue
	for link in "${target_dir}"/*; do
		[ -L "${link}" ] || continue
		case "$(readlink "${link}")" in
			"${SKILLS_DIR}"/*)
				rm "${link}" || {
					echo "Error: failed to remove ${link}" >&2
					result=1
				}
				;;
		esac
	done
done
exit "${result}"
