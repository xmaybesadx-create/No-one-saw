# No One Saw - Game Design Document

Version 0.1 · Based on [vision.md](vision.md)

## 1. Overview

A web detective game in which nobody saw the crime. The player interrogates suspects, collects statements and clues on an investigation board, proves lies with red threads, and accuses the culprit, backing the accusation with evidence.

Core idea: winning is not guessing. It is a **proven conclusion** drawn from contradictions between statements and clues.

## 2. Game loop

1. The player opens a case and reads a short summary: what happened, where, and when.
2. Cards of suspects and clues appear on the board.
3. The player interrogates suspects; every statement lands on the board as a quote card.
4. If the player thinks a quote contradicts a clue, they connect them with a red thread. The system verifies the link.
5. The player makes an accusation: names the culprit and presents the proven contradictions.
6. The system returns the result and reveals what really happened.

## 3. Case structure

One case consists of:

- **Location**: where the crime happened.
- **Victim**: who suffered and under what circumstances.
- **Suspects**: 2-3 people; each has an alibi, a relation to the victim, and something they saw or heard.
- **Clues**: 3-4 items or facts (camera footage, a receipt, a photo, etc.).
- **Truth**: hidden from the player: the culprit, motive, method, the real timeline, the list of key contradictions, and the red herring.

## 4. Interrogation

Clicking a suspect card opens an interrogation panel styled like a recording transcript: photo, name, and text with a typewriter effect.

- Each suspect has 3 topics: alibi, relation to the victim, what they saw or heard.
- Each topic has 1-2 answer fragments. Each click on a topic reveals the next fragment, so the person opens up gradually.
- The server hands out fragments one at a time, so the full dialogue cannot be read from the browser in advance.
- Every revealed fragment becomes a quote card on the board.

**Next stage (after MVP):** confronting suspects with clues. The player drags a clue card onto a suspect and sees a reaction: an innocent person stays calm, the guilty one gets nervous or contradicts themselves.

## 5. Investigation board

The board has three kinds of cards: **suspects**, **clues**, and **quotes**.

- The player connects two cards with a red thread (usually a quote and a clue).
- The system verifies the link:
  - if it is a real contradiction, the quote turns red and gets a "lie proven" mark;
  - otherwise the thread disappears, with no penalty.
- Lies are not highlighted automatically; the player has to find them. Auto-highlighting may come later as an easy difficulty mode.

## 6. Lies and the red herring

- **The culprit lies** about things connected to the crime (alibi, relation to the victim).
- **One innocent suspect also lies**, but about something unrelated: a hidden affair, a debt, a minor theft. This is the red herring.
- So a proven lie is not the same as guilt. The player has to work out which lie is actually connected to the crime.

## 7. Accusation

The player picks the culprit and presents proven contradictions.

| Situation | Result |
|---|---|
| Wrong person named | Defeat |
| Correct person named, but not enough evidence | "Not enough evidence"; the player returns to the board |
| Correct person named, enough evidence | Victory |

- The player has **2 accusation attempts** in total. If the evidence is still insufficient after the second attempt, it is a defeat.
- "Enough evidence" in the MVP: at least **one proven key contradiction** that points to the culprit. A red herring contradiction does not count as a key contradiction.

## 8. Generator requirements (case solvability)

Before a case is served to a player, the validator checks that:

1. The culprit has at least one key contradiction.
2. The evidence for that contradiction (the needed clues and statements) is reachable through interrogation and investigation.
3. The red herring lie cannot be counted as proof of guilt.
4. The culprit can be determined unambiguously from the clues and statements.

A case that fails validation is never served.

## 9. MVP parameters

| Parameter | Value |
|---|---|
| Cases | 1 |
| Suspects | 2-3 |
| Clues | 3-4 |
| Interrogation topics per suspect | 3 |
| Fragments per topic | 1-2 |
| Red herring | 1 innocent suspect |
| Key contradictions | at least 1 |
| Accusation attempts | 2 |
| Penalty for a wrong thread | none |

## 10. Glossary

| Term | Meaning |
|---|---|
| Case | One whole game: location, victim, suspects, clues, truth |
| Truth | What really happened. The player does not see it |
| Suspect | A person who can be interrogated |
| Culprit | The suspect who committed the crime |
| Clue | An item or fact on the board |
| Statement | One fragment of a suspect's answer during interrogation |
| Topic | A subject of a question during interrogation (alibi, relation to the victim, what they saw) |
| Contradiction | A "statement - clue" link that exposes a lie |
| Key contradiction | A contradiction that exposes the culprit |
| Red herring | An innocent suspect's lie about something unrelated to the crime |
| Accusation | The final move: the culprit plus the presented contradictions |
| Attempt | One accusation; the player has 2 |

## 11. Open questions and post-MVP ideas

- Confronting suspects with clues and their reactions.
- A question limit per case and a suspect nervousness indicator.
- Difficulty levels: lie auto-highlighting and the number of attempts.
- Location choice and multiple settings.
- Atmospheric text via an LLM, and sound.
