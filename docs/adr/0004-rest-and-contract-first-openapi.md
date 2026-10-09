# 0004. REST API, OpenAPI contract first

- Status: Proposed
- Date: 2026-10-09

## Context
The frontend and the game service are developed independently by one person; a clear contract reduces rework and gives documentation for free.

## Decision
Expose a REST/JSON API. Write the OpenAPI specification (`docs/openapi.yaml`) before implementing endpoints; serve Swagger UI from the game service. Generate or hand-write frontend types from the same spec.

## Consequences
- The API is documented and testable from day one.
- Changes to the API start in the spec, which keeps the frontend and backend in sync.
- No real-time push in the MVP; the client polls or simply calls the API on user actions (all game actions are user-driven).
