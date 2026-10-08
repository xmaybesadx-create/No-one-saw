# Tech stack

This document lists the tools chosen for the project and why. It deliberately does **not** describe the architecture - that is a separate step (see `docs/adr/`).

**Version policy.** Use the latest stable / LTS release at the time of project setup, then pin exact versions in lockfiles and build files (`pom.xml`, `uv.lock`, `package-lock.json`).

## Game service (Java)
| Tool | Purpose |
|---|---|
| JDK (latest LTS) | Runtime |
| Maven | Build tool (simple, widely used) |
| Spring Boot | Application framework: Web, Validation, Data JPA |
| PostgreSQL | Database |
| Flyway | Versioned database migrations |
| springdoc-openapi | Swagger UI and OpenAPI spec |
| JUnit 5, Mockito, Testcontainers | Unit and integration tests with a real database |
| Spotless or Checkstyle | Code style |

## Case generator (Python)
| Tool | Purpose |
|---|---|
| Python (latest stable) | Runtime |
| uv | Dependency and virtualenv management |
| Pydantic v2 | Case data models and JSON Schema |
| FastAPI | HTTP interface for the generator (if used as a service) |
| pytest | Tests, including "every generated case is solvable" |
| ruff | Linting and formatting |

## Frontend
| Tool | Purpose |
|---|---|
| React + TypeScript | UI |
| Vite | Dev server and build |
| React Flow (`@xyflow/react`) | Investigation board: draggable cards, threads |
| TanStack Query | Server state |
| Tailwind CSS | Styling |
| Vitest + Testing Library | Unit / component tests |
| Playwright | One or two end-to-end scenarios |
| ESLint + Prettier | Linting and formatting |

## Tools (optional, C#)
| Tool | Purpose |
|---|---|
| .NET (LTS) console app | Batch-check generated cases through the API |
| xUnit | Tests |

## Infrastructure and workflow
| Tool | Purpose |
|---|---|
| Docker, Docker Compose | One-command local run |
| GitHub Actions | CI: build and test every part |
| pre-commit | Local checks before commit |
| Conventional Commits | Readable history (`feat:`, `fix:`, `docs:`) |
| GitHub Projects, Issues, Milestones | Planning and goals |

## Design and documentation
| Tool | Purpose |
|---|---|
| Notion | Game design document, notes |
| Mermaid / draw.io | Diagrams |
| Figma | Wireframes |
| Excalidraw | Quick sketches |
| OpenAPI | API contract (written before code) |
| Bruno or Postman | API testing |

## Open questions (to be decided in the architecture step, one ADR each)
- How the game service gets cases from the generator (HTTP call vs. import of generated files)
- Where case data lives and in what shape
- How interrogation fragments are stored and revealed
- Deployment target for the demo
