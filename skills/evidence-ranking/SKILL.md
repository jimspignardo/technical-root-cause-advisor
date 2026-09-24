---
name: evidence-ranking
description: Rank technical sources and proposed fixes by authority, recency, relevance, corroboration, applicability, and operational risk.
---

# Evidence Ranking

## Scoring
Score each recommendation from 0 to 2 in each category:
- Authority
- Recency
- Product and version match
- Symptom match
- Independent corroboration
- Operational safety

Maximum score: 12.

## Interpretation
- 10-12: Strong candidate
- 7-9: Plausible candidate requiring validation
- 4-6: Weak or environment-dependent
- 0-3: Do not recommend without additional evidence

## Rules
- Official documentation is not automatically applicable to every version.
- Recent guidance does not automatically override version-specific guidance.
- Penalize irreversible changes and security-control bypasses.
- Explain why the top recommendation outranks alternatives.
