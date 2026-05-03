# Contributing

This is a solo developer project, but commits should still be written clearly so the project history is easy to review during job applications.

## Conventional Commits

Use this format:

```text
type: short imperative summary
```

Use lowercase for the type. Keep the summary specific, direct, and under 72 characters when possible.

Allowed types:

- `feat`: Adds a new user-facing capability or project capability.
- `fix`: Corrects a bug, broken command, incorrect query, or bad data handling.
- `docs`: Updates documentation only.
- `refactor`: Improves code or SQL structure without changing behavior.
- `chore`: Handles repository maintenance, tooling, or setup work.
- `test`: Adds or updates checks that verify behavior.
- `style`: Changes formatting only, with no behavior change.

## Project-Specific Examples

- `feat: add query for top pages by total sessions`
- `fix: import conversion_rate without breaking on percent values`
- `docs: document local PostgreSQL analysis workflow`
- `refactor: separate table creation from analysis queries`
- `chore: add docker compose setup for analytics database`
- `test: add sample data check for required analytics columns`
- `style: align SQL keywords in website traffic queries`
