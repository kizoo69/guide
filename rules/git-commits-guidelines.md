---
trigger: always_on
description: git 커밋 메시지 작성 규칙과 커밋 워크플로
---

# Git Commit Guidelines

- **Style**: Use the imperative mood in the subject line (e.g., "Add feature" not "Added feature").
- **Subject Line**: Keep it short and descriptive, ideally under 72 characters.
- **Body**: Explain the "why" and "what" of the change, not just the "how".
- **Simplicity**: Keep messages clear and concise.
- **Footers**: Do NOT add footers like "Co-authored-by" or "Generated with..."
- **Emojis**: Do not use emojis in commit messages.

## Commit Workflow

When a task is complete, commit all changes. Push only after confirming with the user.

1. `git status` to review all changed files.
2. Group related files into logical commits (e.g., new content, deletions, updates each as separate commits).
3. Ask the user before pushing.
