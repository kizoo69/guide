---
trigger: always_on
description: 코드 리뷰 기준
---

# Code Review Guidelines

Always proactively analyze and suggest improvements based on the following checklist.

## Shell Script Checklist

### 1. Philosophy & Output
- [ ] **No News is Good News**: Does the script remain silent on success?
    - Are commands wrapped in `silently` where appropriate?
    - Are informational messages suppressed or directed to stderr only when necessary?
- [ ] **Verbose Errors**: Do error messages provide enough context to debug?
    - Do fatal errors use the `error` utility?
    - Do fatal errors start with the prefix `Error: `?
- [ ] **Usage**: Is a `usage()` function defined?
    - Is it called on syntax errors or invalid arguments?
    - Does it use `$(basename "$0")` instead of hardcoded names?

### 2. Robustness & Security
- [ ] **Defensive Coding**: Are dependencies checked early?
    - Pattern: `! executable cmd && error "Error: cmd not found" && exit 1`
- [ ] **Idempotency**: Can the script run multiple times without side effects?
- [ ] **Safety**: Are file operations (overwrites) handled safely (e.g., using `link_safely`)?
- [ ] **POSIX Compliance**: Are Bash-isms (`[[ ]]`, `==`) avoided unless the shebang is explicitly `bash`?

### 3. Code Style & Reusability
- [ ] **Reusability**: Does the script utilize existing `shell/bin/` utilities?
    - `executable`, `silently`, `is-ubuntu`, `is-darwin`, `error`
- [ ] **DRY Comments**: Are comments used only for complex logic, avoiding restatement of obvious code?
- [ ] **Naming**: do filenames use kebab-case?

## General
- [ ] **Git**: Do commit messages follow the [.ai/git-commits-guidelines.md](git-commits-guidelines.md)?