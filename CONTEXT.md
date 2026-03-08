# CONTEXT.md

This file provides guidance to the AI assistant when working with code in this repository.

1. After writing code, list what could break and suggest tests to cover it.

2. If the test fail, then fix it until the test passes.

3. Every time I correct you, add a new rule to the CLAUDE.md file so it never happens again.

4. Keep answers short and concise (hopefully, under 3 lines excluding code blocks).

5. Follow the job-specific guidelines below.

## Java Project Defaults
**MANDATORY**: Read [.ai/java-project-defaults.md](.ai/java-project-defaults.md) before creating/migrating any Java Projects.

## Git Commits
**MANDATORY**: Read [.ai/git-commits-guidelines.md](.ai/git-commits-guidelines.md) before making any commits.

## Documentation
**MANDATORY**: Read [.ai/technical-writing-guidelines.md](.ai/technical-writing-guidelines.md) before writing Korean documentation.

## Code Review
**MANDATORY**: Read [.ai/code-review-guidelines.md](.ai/code-review-guidelines.md)

## Workbook 교수 설계
**MANDATORY**: Read [.ai/pedagogical-guidelines.md](.ai/pedagogical-guidelines.md) before creating or reviewing workbooks.

## Active Plans
- **테이블 스타일 리팩터링**: Read [.ai/table-style-refactor.md](.ai/table-style-refactor.md) before working on table CSS.

## Shell Scripting & Coding Standards

### Core Philosophy

1.  **"No News is Good News"**: Scripts should generally remain silent on success. Output is reserved for when an action is required or an error occurs.
2.  **Verbose on Errors**: When an error occurs, provide enough detail (what happened and why) to aid debugging.
3.  **Defensive Coding**: Check conditions (e.g., file existence, dependencies) early. Be robust but avoid over-specification that code brittle.

### Implementation Patterns
1.  **Logical Operators**: Prefer `cmd && success || fail` over verbose `if-then-else` blocks when logic is simple and linear.
2.  **Usage Functions**: Always define a `usage()` function. Call it explicitly when syntax errors or invalid arguments are detected.
3.  **Dynamic Naming**: Never hardcode the script name in output messages. Use `$(basename "$0")` to ensure consistency if the filename changes.
4.  **Comments**: Apply DRY (Don't Repeat Yourself). Do not write comments that just repeat what the code clearly says.
5.  **Standard Output**: Differentiate simple warnings from fatal errors.
