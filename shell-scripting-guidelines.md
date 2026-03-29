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
