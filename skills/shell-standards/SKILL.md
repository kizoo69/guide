---
name: shell-standards
description: >
  Read BEFORE writing, editing, or reviewing any shell script (sh, bash, zsh),
  and before naming a script file, function, variable, or constant.
  Covers output discipline (silence on success, detail on failure), usage()
  functions, defensive checks, POSIX compliance, idempotency, safe overwrites,
  comment discipline, and the Google Shell Style Guide naming rules.
  Open it BEFORE the first line is written — a review after the fact is too late.
---

# Shell Scripting Standards

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
6.  **POSIX Compliance**: Avoid Bash-isms (`[[ ]]`, `==`) unless the shebang is explicitly `bash`.
7.  **Idempotency**: A script must be safe to run repeatedly without side effects.
8.  **Safe Overwrites**: Back up a file before overwriting it.

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
