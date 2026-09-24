---
name: powershell-command-review
description: Review PowerShell diagnostic and remediation commands for correctness, scope, safety, idempotence, and rollback.
---

# powershell command review

## Process
- Explain command purpose; identify required modules and permissions; separate read-only from change commands; use -WhatIf where supported; scope destructive operations narrowly; never embed credentials; include verification and rollback guidance.
- Consult technical-source-research for evidence.
- Send ranked hypotheses to root-cause-analysis.
- Use remediation-planner before recommending production changes.

## Rules
- Prefer official vendor guidance.
- Label facts, assumptions, and inferences.
- Use the least disruptive diagnostic first.
- Require human review for production-impacting actions.
- Include validation and rollback for changes.
