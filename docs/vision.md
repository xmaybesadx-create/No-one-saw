# No One Saw - Vision

Version 0.1

## Pitch
A modern web detective game. Every time the system generates a new case in which nobody saw the crime. The player interrogates suspects, studies evidence on an investigation board, finds contradictions in testimonies, and accuses the culprit.

## Game session (5-10 minutes)
1. Read the case summary: what happened, where, when.
2. Cards of suspects and evidence appear on the board.
3. Interrogate suspects and open evidence.
4. Find a contradiction between a statement and a piece of evidence.
5. Press "Accuse". The system checks the answer and reveals what really happened.

## Interrogation (core mechanic)
Clicking a suspect opens an interrogation panel styled as a recording transcript (photo, name, typed-out text).

- **Stage 1 (MVP): question topics.** Each suspect has 3 topics (alibi, relation to the victim, what they heard). Each click reveals the next fragment of the answer, so a person opens up gradually.
- **Stage 2: confronting with evidence.** Drag an evidence card onto a suspect and watch the reaction: the innocent stays calm, the guilty gets nervous or contradicts themselves.
- **Stage 3: statements on the board.** Every statement becomes a quote card that can be linked to evidence with a red thread.

The server reveals answers piece by piece, so the full dialogue cannot be read from the browser in advance.

## Audience
Teens and adults who like detective stories and short puzzles. Secondary audience: recruiters and engineers reviewing this portfolio project.

## Atmosphere
Modern look: investigation board, photos, red threads.

## Format
Web application.

## MVP
- 1 case, 2-3 suspects, 3-4 pieces of evidence
- Topic-based interrogation (3 topics per suspect, 1-2 fragments per topic)
- Simple board, no complex animation
- Accusation check and a final "what really happened" screen

## After MVP
- Confronting suspects with evidence
- Quote cards and red threads on the board
- Question limit per case, suspect nervousness indicator
- Location choice and multiple settings
- LLM-written atmospheric text, sound

## Non-goals (for now)
- Complex graphics and heavy rendering
- Multiple locations and settings
- Accounts, ratings, multiplayer
- Mobile app

## Success criteria
- A case can be played from start to accusation without errors
- Every generated case is solvable
- New mechanics and settings can be added without rewriting the core
- The UI looks polished and fits the investigation-board style
