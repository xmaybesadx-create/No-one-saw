# 0006. React SPA with React Flow for the board

- Status: Proposed
- Date: 2026-10-09

## Context
The core UI is an investigation board: draggable cards and red threads between them, plus an interrogation panel with a typewriter effect.

## Decision
Build a single-page application with React, TypeScript and Vite. Use React Flow (`@xyflow/react`) for the board: cards are custom nodes, threads are edges. The SPA talks only to the game service.

## Consequences
- Drag and drop, panning and edges come from the library, so effort goes into game UI rather than graph plumbing.
- Visual style (photos, red threads) is achieved with custom node and edge components.
- The frontend is a static build that can be hosted separately from the backend.
