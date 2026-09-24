# Technical Root Cause Advisor

A Microsoft 365 Copilot declarative agent by Jim Spignardo that investigates technical problems, ranks evidence, and proposes diagnostics, remediation, rollback, and verification steps.

This repository contains an exported agent definition and its supporting skills. It is not a standalone web application or a hosted AI service. Publishing the repository does not deploy the agent to Microsoft 365.

## Included skills

| Skill | Purpose |
| --- | --- |
| Technical source research | Find applicable technical evidence |
| Log and error analysis | Organize errors, timelines, and failure domains |
| Microsoft 365 troubleshooting | Investigate Microsoft 365 issues |
| AI workload troubleshooting | Investigate agents, models, retrieval, and quotas |
| Evidence ranking | Compare hypotheses and recommendations |
| PowerShell command review | Review commands for scope and operational risk |
| Remediation planner | Define implementation, rollback, and validation |
| Incident response writer | Write evidence-based incident updates |

The agent instructions perform root cause analysis directly. References to `root-cause-analysis` in skills refer to this orchestration layer, not a missing skill directory.

## Repository layout

- `manifest.json`: exported Microsoft 365 app manifest, version 1.0.1.
- `declarativeAgent_0.json`: agent instructions, capabilities, starters, and skill references.
- `skills/`: eight exported skill definitions.
- `color.png` and `outline.png`: original app icons.
- `scripts/package.ps1`: local structural validation and ZIP packaging.
- `.github/workflows/validate.yml`: repeat the packaging checks on GitHub.

## Validate and package

Use PowerShell 7 from the repository directory:

```powershell
pwsh -File ./scripts/package.ps1
```

The script checks JSON parsing, manifest references, skill references and names, and PNG signatures. It then writes `dist/technical-root-cause-advisor.zip` with the app manifest at the archive root. Only referenced app files and skills are packaged.

These checks do not replace Microsoft schema validation or a tenant installation test. Runtime behavior and installation have not been verified in Microsoft 365.

## Configure for your environment

1. Review the agent instructions and each skill for your organization's needs.
2. Configure approved organizational knowledge sources. The public version deliberately leaves `OneDriveAndSharePoint.items_by_url` empty; the original export's organization-specific SharePoint address was removed before publication.
3. Review the declared WebSearch, OneDriveAndSharePoint, TeamsMessages, Email, Meetings, and CodeInterpreter capabilities. Availability and access depend on the target Microsoft 365 environment and its policies.
4. Review the exported app and agent identifiers before creating a separate app identity. The original identifiers have been preserved for traceability; they are not credentials.
5. Review developer website, privacy, and terms links in `manifest.json`. They are the original Microsoft-generated links and have not been replaced with project-specific legal policies.
6. Validate and package, then use your organization's supported Microsoft 365 agent/app import and validation process. Confirm support for the exported manifest and agent schema versions, including agent skills.
7. Test with non-sensitive sample incidents before broader use.

Keep organization-specific configuration and investigation data out of this public repository. No email, meeting, Teams, or SharePoint content is bundled with the export.

## Example prompts

- Research this error message, rank the likely causes, and recommend diagnostic steps.
- Analyze this failed deployment and propose rollback and recovery steps.
- Compare vendor guidance and explain which recommendation fits this environment.
- Review this proposed fix for prerequisites, risks, and success criteria.

## Provenance and licensing

Imported from the user-provided Technical Root Cause Advisor export. Agent instructions, skills, icons, and app metadata are retained, apart from removal of the organization-specific knowledge-source URL and JSON formatting. Repository documentation and packaging automation were added.

No open-source license has been selected. Public visibility alone does not grant an open-source license.
