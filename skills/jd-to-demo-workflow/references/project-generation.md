# Project Generation

Use this reference to turn job/applicant matching into a fast buildable project.

## Inputs to consider

- target role
- company/business domain
- top 3-5 job requirements
- applicant's current skills
- applicant's missing proof
- available time: 24h, 48h, 72h, or unknown
- desired positioning: AI application, full-stack, frontend, backend, data, product-minded engineer

## Project selection rule

Choose the project that maximizes:

```text
job relevance + visible proof + buildability
```

Do not choose the most impressive-sounding project if it cannot be completed.

## Time-boxed scope

### 24 hours

Use:

- frontend or simple full-stack
- mock AI output
- one core workflow
- example data
- README + screenshots + HR message

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

## Required project brief

Return:

- project name
- one-sentence positioning
- target user
- core input
- core output
- must-have features
- non-goals
- pages
- API endpoints
- data entities
- AI behavior/prompt direction
- mock mode
- environment variables
- acceptance criteria
- resume bullet
- HR/BOSS message

## Scope guardrail

If the user asks for a project that is too big, preserve the job relevance but reduce scope.

Example:

```text
Instead of building a full recruiting platform, build an AI JD analysis and candidate matching workbench.
```

## Output emphasis

The final Codex project prompt should be the most complete artifact. It must be directly pasteable into a new Codex thread.

