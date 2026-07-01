# Project Generation

Use this reference to turn job/applicant matching into three selectable project routes, then generate the selected project after confirmation.

## Inputs to consider

- target role
- company/business domain
- top 3-5 job requirements
- applicant's current skills
- applicant's missing proof
- available time: 24h, 48h, 72h, or unknown
- desired positioning: AI application, full-stack, frontend, backend, data, product-minded engineer
- user preference: fastest viable build, strongest job match, strongest technical showcase, or undecided

## Route selection rule

Before the user confirms a direction, propose three routes:

1. Fastest viable build
2. Strongest job match
3. Strongest technical showcase

Each route must be meaningfully different. Compare them by:

```text
job relevance + visible proof + buildability + technical depth + user explainability
```

Do not choose the most impressive-sounding project if it cannot be completed or explained by the applicant.

## Required route fields

For each route, return:

- route name
- project name
- one-sentence positioning
- target user
- core product logic
- core user flow
- job requirements it proves
- recommended tech stack and why
- must-have features
- non-goals
- pages
- API endpoints
- data entities
- AI behavior/prompt direction
- mock mode
- environment variables
- time estimate
- implementation risk
- downgrade plan
- resume angle
- HR/BOSS message angle

## Time-boxed scope

### 24 hours

Use:

- frontend or simple full-stack
- mock AI output
- one core workflow
- example data
- README + HR message

Avoid:

- real auth
- file upload parsing
- vector database
- multi-role permissions

### 48 hours

Use:

- full-stack workflow
- simple persistence
- mock mode plus optional real API route
- history or export
- strong README and demo script

### 72 hours

Use:

- deployment
- charts or dashboard
- optional RAG/source panel
- better error states
- richer sample data

## Confirmation behavior

If no route is confirmed:

- recommend one route
- explain why it fits the applicant
- ask the user to confirm route A/B/C or request a hybrid
- do not generate full project code yet

If a route is confirmed:

- generate the selected project directly when working in an implementation workspace
- otherwise generate a complete Codex-ready build prompt
- include README, mock data, `.env.example`, acceptance criteria, resume bullet, HR/BOSS message, and demo script

## Scope guardrail

If the user asks for a project that is too big, preserve job relevance but reduce scope.

Example:

```text
Instead of building a full recruiting platform, build an AI JD analysis and candidate matching workbench.
```

## Output emphasis

Before confirmation, the three-route comparison is the most important artifact.

After confirmation, the generated project or final Codex build prompt is the most important artifact. It must be directly usable by Codex without re-explaining the job.
