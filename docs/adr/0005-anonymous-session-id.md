# 0005. Anonymous session id instead of accounts

- Status: Accepted
- Date: 2026-10-09

## Context
Accounts are a non-goal for the MVP, but progress must survive closing the browser tab.

## Decision
A new game creates a `GameSession` whose random UUID is returned to the client and stored in the browser (localStorage). All game endpoints are addressed by this id. The UUID is unguessable and is the only credential.

## Consequences
- No registration or login; the player can resume on the same browser.
- Progress is tied to the browser; clearing storage loses access to the session.
- Adding accounts later means linking sessions to a user id, without changing the game rules.
