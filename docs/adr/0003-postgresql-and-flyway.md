# 0003. PostgreSQL with Flyway migrations

- Status: Proposed
- Date: 2026-10-09

## Context
The domain model is relational (cases, suspects, topics, statements, contradictions, sessions) and sessions must survive closing the browser tab.

## Decision
Store everything in PostgreSQL using normalized tables that follow `docs/domain-model.md`. Manage the schema with Flyway migrations kept in the game service. Use Testcontainers for integration tests against a real database.

## Consequences
- Referential integrity protects the invariants (for example, a contradiction always references a statement and a clue).
- Schema changes are versioned and reproducible.
- Requires a running database locally (Docker Compose).
