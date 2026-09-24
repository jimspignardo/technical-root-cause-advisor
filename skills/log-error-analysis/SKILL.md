---
name: log-error-analysis
description: Analyze logs, error output, event records, and command results to identify patterns, timelines, and likely failure domains.
---

# Log and Error Analysis

## Process
1. Identify product, component, host, scope, and logging time zone.
2. Normalize timestamps across systems.
3. Extract error codes, exceptions, correlation IDs, and failed operations.
4. Group repeated errors and separate primary from cascading failures.
5. Build a timeline around the first meaningful failure.
6. Compare the timeline with deployments and configuration changes.
7. Map findings to documented causes.
8. Pass ranked findings to root-cause-analysis.

## Safety
- Redact passwords, tokens, cookies, keys, and connection strings.
- Minimize personal and tenant-specific data.
- Never reproduce secrets.
- Warn when logs may contain regulated or confidential information.

## Output
- Timeline
- Primary error
- Secondary errors
- Affected component
- Relevant identifiers
- Likely failure domain
- Additional logs or tests needed