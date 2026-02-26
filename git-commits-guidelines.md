# Git Commit Guidelines

- **Style**: Use the imperative mood in the subject line (e.g., "Add feature" not "Added feature").
- **Subject Line**: Keep it short and descriptive, ideally under 72 characters.
- **Body**: Explain the "why" and "what" of the change, not just the "how".
- **Simplicity**: Keep messages clear and concise.
- **Footers**: Do NOT add footers like "Co-authored-by" or "Generated with..."
- **Emojis**: Do not use emojis in commit messages.

## Commit Workflow

When a task is complete, commit and push all changes without being asked.

1. `git status` to review all changed files.
2. Group related files into logical commits (e.g., new content, deletions, updates each as separate commits).
3. Push after all commits are done.

## Repo Setup (run automatically, without being asked)

After cloning, or after the `.ai` submodule is initialized/updated, always run both:

```sh
git submodule update --init --remote .ai  # if submodule is empty
.ai/hooks/install
```

These are mandatory and easy to forget — run them proactively.
