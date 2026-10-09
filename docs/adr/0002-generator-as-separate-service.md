# 0002. Case generator is a separate service, called on demand

- Status: Accepted
- Date: 2026-10-09

## Context
Every game needs a fresh, solvable case. Generation and validation are algorithmic work that fits Python well, while the game rules and state are handled in Java. The options were: (a) the game service calls the generator when a game starts, or (b) the generator pre-fills a pool of cases that the game service only serves.

## Decision
The generator is a stateless FastAPI service. The game service calls `POST /v1/cases` when a new game starts. The generator validates solvability itself and retries internally; the game service additionally validates the response against the published JSON Schema.

## Consequences
- Every game gets a unique case; the generator is a real, independently runnable service.
- Starting a game depends on the generator being available and fast. Without an LLM generation is quick; if that changes, a pool of pre-generated cases can be added as a cache without changing the API.
- Two services to run locally (handled by Docker Compose).
