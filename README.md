# Development & Writing Guidelines

This repository contains a collection of guidelines for software development and technical writing. The goal is to establish a clear, consistent, and high-quality standard for all projects.

## Skills

Loaded on demand. Each skill is a `skills/<name>/SKILL.md` file.

- **[Programming](./skills/programming/SKILL.md)**: Language-independent principles for writing, refactoring, and reviewing code. Shell Standards and Java Defaults build on it.
- **[Shell Standards](./skills/shell-standards/SKILL.md)**: Output discipline, implementation patterns, and naming for shell scripts.
- **[Java Defaults](./skills/java-defaults/SKILL.md)**: Default configurations, dependencies, and testing conventions for Java projects.
- **[Technical Writing](./skills/technical-writing/SKILL.md)**: Rules and conventions for technical writing and documentation in Korean.
- **[Pedagogical Principles](./skills/pedagogical-principles/SKILL.md)**: Core pedagogical principles for designing and reviewing educational materials.
- **[Workbook Authoring](./skills/workbook-authoring/SKILL.md)**: Guidelines, dialogue structure, tags, and review checklist for workbook authoring. Builds on Pedagogical Principles and Technical Writing.

## Install

```sh
git clone https://github.com/kizoo69/guide.git
cd guide
./install.sh
```

`install.sh` symlinks every skill into each harness it finds: `~/.claude/skills/` (Claude Code) and `~/.gemini/antigravity-cli/skills/` (Antigravity CLI). To link into another directory, pass it as an argument: `./install.sh <skills_dir>`.

- Skills refer to each other by relative path, so all of them are linked together.
- Links point into the clone. Edits apply without reinstalling (a new session may be needed); `git pull` is the update.
- Run `./install.sh` again after moving the clone or adding a skill. It is safe to rerun and removes links left by deleted skills.
- An existing entry with the same name is left alone and reported.

## Uninstall

```sh
./uninstall.sh
```

Removes only the links that point into this clone. Skills from other sources stay.
