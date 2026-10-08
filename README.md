# No One Saw

> A detective web game where **nobody saw the crime**. Interrogate suspects, pin evidence to the investigation board, connect the red threads, and make your accusation.

![status](https://img.shields.io/badge/status-planning-orange)
![license](https://img.shields.io/badge/license-MIT-blue)

## Concept

Every case is generated from scratch. There is no eyewitness: the only way to find the culprit is to catch contradictions between what suspects say and what the evidence shows.

A session takes 5-10 minutes:

1. Read the case summary.
2. Interrogate suspects (topic by topic, answers are revealed gradually).
3. Study the evidence on the board.
4. Spot the contradiction.
5. Accuse - the system checks your answer and reveals what really happened.

Full details: [docs/vision.md](docs/vision.md).

## Tech stack

| Layer | Technology |
|---|---|
| Game service | Java, Spring Boot, PostgreSQL |
| Case generator | Python, FastAPI, Pydantic |
| Frontend | React, TypeScript, Vite, React Flow |
| Tooling (optional) | C# / .NET console utility |
| Infrastructure | Docker, Docker Compose, GitHub Actions |

Details and rationale: [docs/stack.md](docs/stack.md).

## Repository layout

```
no-one-saw/
├── docs/            # vision, stack, ADRs (architecture docs come later)
├── generator/       # Python: case generation and validation
├── game-service/    # Java: game logic and API
├── frontend/        # React: investigation board UI
├── tools/           # C#: optional helper tools
├── scripts/         # repo setup helpers
└── .github/         # issue / PR templates, workflows
```

## Status

Phase 0: planning and documentation. Progress is tracked in GitHub Milestones and the project board.

## Documentation

- [Vision (one-pager)](docs/vision.md)
- [Tech stack](docs/stack.md)
- [Architecture decision records](docs/adr/)
- [Contributing / workflow](CONTRIBUTING.md)

## License

MIT - see [LICENSE](LICENSE).
