# Requirement Matching

Use this reference to translate recruitment requirements into project evidence.

## Core principle

Do not generate a generic project. Generate the smallest project that proves the highest-priority ability signals from the job.

Every recommendation should follow this chain:

```text
job requirement -> ability signal -> demo proof -> implementation artifact -> resume/HR wording
```

## Requirement categories

### Hard technical skills

Examples:

- React / Vue / TypeScript
- Node.js / Python / Java
- SQL / PostgreSQL / MongoDB / SQLite
- LLM API / RAG / Agent / Prompt Engineering
- Docker / deployment / CI

Translate into visible proof:

- pages
- API endpoints
- data model
- structured AI output
- deployed or locally runnable app
- README and `.env.example`

### Business/domain signals

Examples:

- recruiting / HRTech
- education
- customer support
- operations / growth
- e-commerce
- internal tools
- data dashboard

Translate into project scenario:

- target user
- realistic input data
- structured output
- domain-specific report
- sample dataset matching the job

### Hidden ability signals

Common hidden signals:

- can understand business context
- can scope a feature
- can deliver a complete workflow
- can explain technical decisions
- can work with product/backend teammates
- can handle edge states

Translate into deliverables:

- one-sentence positioning
- clear MVP and non-goals
- empty/loading/error states
- demo script
- README explaining role alignment
- screenshots checklist

## Priority scoring

Assign each signal a priority:

- P0: must prove; central to job screening
- P1: helpful differentiator
- P2: optional polish

The final project must prove all P0 signals and at least one P1 signal. Do not expand scope for P2 signals unless time budget allows.

## Matching table

Use this table in reasoning or final output when useful:

| Requirement | Ability signal | Demo proof | Priority |
| --- | --- | --- | --- |
| React/Vue | Frontend implementation | Working dashboard/workbench UI | P0 |
| Node/Python | Backend integration | API routes for analysis/report/history | P0 |
| LLM API | AI application ability | Structured AI analysis with mock/API mode | P0 |
| RAG | Knowledge retrieval | Optional cited snippets/source panel | P1 |
| Project experience | End-to-end delivery | README, demo data, screenshots, deploy notes | P0 |

## Anti-patterns

Avoid:

- suggesting a generic chat bot when the job has a clear business scene
- adding many shallow pages instead of one complete workflow
- recommending advanced infra before the MVP works
- hiding a gap by faking experience
- creating a project that cannot be finished within the user's time budget

