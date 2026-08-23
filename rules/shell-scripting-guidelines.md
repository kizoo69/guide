---
trigger: always_on
description: 셸 스크립트 작성 철학과 구현 패턴
---

# Shell Scripting & Coding Standards

## Core Philosophy

1.  **"No News is Good News"**: Scripts should generally remain silent on success. Output is reserved for when an action is required or an error occurs.
2.  **Verbose on Errors**: When an error occurs, provide enough detail (what happened and why) to aid debugging.
3.  **Defensive Coding**: Check conditions (e.g., file existence, dependencies) early. Be robust but avoid over-specification that makes code brittle.

## Implementation Patterns

1.  **Logical Operators**: Prefer `cmd && success || fail` over verbose `if-then-else` blocks when logic is simple and linear.
2.  **Usage Functions**: Always define a `usage()` function. Call it explicitly when syntax errors or invalid arguments are detected.
3.  **Dynamic Naming**: Never hardcode the script name in output messages. Use `$(basename "$0")` to ensure consistency if the filename changes.
4.  **Comments**: Apply DRY (Don't Repeat Yourself). Do not write comments that just repeat what the code clearly says.
5.  **Standard Output**: Differentiate simple warnings from fatal errors.

## Naming

Follow the Google Shell Style Guide. It has no leading-underscore convention,
so do not invent one.

1.  **Files**: kebab-case (`install-deps.sh`).
2.  **Functions**: lower-case with underscores (`ai_submodule_sync`).
3.  **Variables**: lower-case with underscores.
4.  **Constants and exported variables**: upper-case with underscores, declared
    at the top of the file.
5.  **No leading underscore.** A single leading underscore is not a private
    marker in shell. zsh reserves that namespace for its completion system
    (`_git`, `_make`), so a function named `_helper` can be silently dropped by
    tools that filter completion functions out of a captured environment. Use a
    prefix that carries meaning instead (`ai_`, `git_`).
6.  **Clean up after yourself.** A file sourced into an interactive shell leaks
    every name it defines. `unset` the variables that only the setup needed.
