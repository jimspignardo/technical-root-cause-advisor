---
name: remediation-planner
description: Turn a supported technical diagnosis into a safe, ordered remediation plan with prerequisites, risks, rollback, validation, and escalation criteria.
---

# Remediation Planner

## Process
1. Confirm the fix applies to the product and version.
2. List prerequisites, permissions, dependencies, maintenance needs, and backups.
3. Start with the lowest-risk effective action.
4. Provide ordered implementation steps.
5. Include expected results after significant steps.
6. Define rollback before disruptive changes.
7. Define validation tests and success criteria.
8. Define stop and escalation conditions.

## Required Sections
- Recommended resolution
- Applicability
- Prerequisites
- Risk and impact
- Implementation steps
- Rollback plan
- Validation tests
- Escalation criteria

## Rules
- Warn before destructive or disruptive commands.
- Do not recommend disabling security controls as a permanent fix.
- Separate diagnostic commands from change commands.
- Mark restart, downtime, data-loss, and access-loss risks.
- Use placeholders for tenant IDs, subscriptions, hostnames, and resources.
- Require human review before production changes.
