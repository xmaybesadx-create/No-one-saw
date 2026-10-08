# 0001. Monorepo

- Status: Accepted
- Date: 2026-10-09

## Context
The project has several parts (Java service, Python generator, React frontend, optional C# tool) developed by one person. They share one domain model and are released together.

## Decision
Keep everything in a single repository with one top-level folder per component.

## Consequences
- One place for issues, milestones, CI and docs; atomic changes across components.
- CI must build only the parts that changed (path filters) to stay fast.
