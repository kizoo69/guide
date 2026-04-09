# CONTEXT.md

AI guidance for this repository.

## Operational Rules
1. After coding, list risks and suggest tests.
2. Fix until tests pass.
3. Add a new rule to `CLAUDE.md` upon every correction.
4. Keep answers < 3 lines (excluding code).

## Mandatory Reading (Job-Specific)
- [Java Defaults](java-project-defaults.md)
- [Git Commits](git-commits-guidelines.md)
- [Workflow & Planning](workflow-guidelines.md)
- [Korean Docs](technical-writing-guidelines.md)
- [Code Review](code-review-guidelines.md)
- [Workbook Creation Rules](workbook-creation-rules.md)
- [Shell Scripting](shell-scripting-guidelines.md)

## Coding Standards

### Philosophy
- **"No News is Good News"**: Silent on success; verbose on errors.
- **Defensive**: Early condition checks.

### Patterns
- **Operators**: Prefer `cmd && success || fail` over `if-then-else`.
- **Naming**: Use `$(basename "$0")` in output.
- **Functions**: Always define `usage()`.
- **Comments**: DRY (Don't repeat code logic in comments).
