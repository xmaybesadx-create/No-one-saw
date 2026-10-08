#!/usr/bin/env bash
# Creates labels and milestones in the current repo. Requires GitHub CLI (gh) logged in:
#   gh auth login
# Run from the repository root:  bash scripts/setup-github.sh
set -euo pipefail

label() { gh label create "$1" --color "$2" --description "$3" --force; }

label "type: feature"  "1d76db" "New capability"
label "type: bug"      "d73a4a" "Something is broken"
label "type: docs"     "0075ca" "Documentation"
label "type: chore"    "cfd3d7" "Maintenance, setup, tooling"
label "type: adr"      "5319e7" "Architecture decision"
label "area: generator"    "fbca04" "Python case generator"
label "area: game-service" "e99695" "Java game service"
label "area: frontend"     "0e8a16" "React frontend"
label "area: infra"        "bfd4f2" "Docker, CI, repo"
label "area: tools"        "c5def5" "C# tools"
label "priority: must"   "b60205" "MVP-critical"
label "priority: should" "d93f0b" "Important, not blocking"
label "priority: could"  "fef2c0" "Nice to have"

milestone() { gh api "repos/{owner}/{repo}/milestones" -f title="$1" -f description="$2" >/dev/null; }

milestone "M0 Foundation"   "Docs, repo, CI; empty services run via docker-compose"
milestone "M1 Case as JSON" "Generator produces one valid, solvable case"
milestone "M2 Playable API" "Game service serves a case, handles interrogation and accusation"
milestone "M3 Board"        "Frontend board with the full game loop"
milestone "M4 Polish"       "Tests, README with screenshots/GIF, demo deployment"
milestone "M5 Bonus"        "Confront with evidence, red threads, LLM text, more settings"

echo "Done."
