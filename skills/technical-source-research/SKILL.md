---
name: technical-source-research
description: Research technical problems across trusted vendor documentation, support articles, release notes, issue trackers, internal knowledge, and reputable communities. Use when evidence from multiple technical sources is needed.
---

# Technical Source Research

## Objective
Find current, authoritative evidence related to a technical symptom, error, product behavior, configuration, or known issue.

## Process
1. Extract the product, version, platform, error text, scope, and observed symptoms.
2. Search exact error strings before general symptoms.
3. Prefer official documentation, support articles, advisories, release notes, health pages, and vendor-maintained issue trackers.
4. Check publication date, affected versions, prerequisites, and applicability.
5. Seek two independent supporting sources when possible.
6. Record conflicts, version differences, and evidence gaps.
7. Compare external guidance with internal architecture standards and runbooks.
8. Return findings to root-cause-analysis.

## Source Expansion and Knowledge-Source Limits
Configured public webpages are seed sources, not the complete approved-source list.

1. Use broad documentation landing pages rather than separate entries for every product section.
2. Use web search to locate pages on approved vendor domains.
3. Reserve attached organizational knowledge for internal SharePoint content that public search cannot access.
4. Never claim a source was searched unless its content was reviewed.
5. If web search is unavailable, state that research is limited to configured knowledge and user-provided material.

### Microsoft Documentation Consolidation
Treat learn.microsoft.com as the main Microsoft documentation platform. Search relevant areas for Azure, Microsoft 365, Entra, Windows, PowerShell, Microsoft Graph, security, architecture, troubleshooting, and release notes.

### Approved External Domains
Use only when relevant to the affected product:
- learn.microsoft.com
- techcommunity.microsoft.com
- github.com
- cisco.com
- dell.com
- hp.com
- hpe.com
- lenovo.com
- vmware.com
- broadcom.com
- aws.amazon.com
- amazon.com
- paloaltonetworks.com
- fortinet.com
- juniper.net

This list defines approved research targets. It does not automatically attach their content as agent knowledge.

### Search Sequence
1. Identify product, version, component, and exact error.
2. Select only relevant domains.
3. Search official product documentation.
4. Search official support and KB articles.
5. Search advisories, release notes, and known-issue pages.
6. Search official repositories and maintainer-confirmed issues.
7. Use communities only for corroboration or hypothesis discovery.
8. Compare findings with internal standards and runbooks.
9. Rank resolutions by evidence quality, safety, and environmental fit.

### Source Budget
When direct website sources are limited, allocate them in this order:
1. Broad official documentation portal
2. Official support or troubleshooting portal
3. Official engineering community or issue tracker
4. Highest-priority vendor for the agent scope

### Evidence Requirements
Capture source title, domain, product/version applicability, update date when available, supporting evidence, warnings, prerequisites, and whether the source is authoritative or corroborating.

### Internal Knowledge Precedence
Compare recommendations against internal architecture standards, security baselines, procedures, runbooks, and approved exceptions. Identify conflicts and do not silently override internal standards.

## Rules
- Never treat a single forum answer as confirmed resolution.
- Do not recommend commands from an untrusted source without analysis.
- Distinguish verified facts from inferences.
- Preserve source titles and links for citation.
- Flag obsolete or version-mismatched material.
- Do not invent documentation, commands, fixes, or citations.
- Search snippets alone are not sufficient evidence for a production change.

## Output
- Search interpretation
- Relevant findings
- Affected versions and environments
- Source authority and recency
- Applicability
- Conflicting evidence
- Evidence gaps
- Sources actually consulted