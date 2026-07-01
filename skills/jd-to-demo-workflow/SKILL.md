---
name: jd-to-demo-workflow
description: Generate fast, highly job-relevant student portfolio/demo projects from recruitment requirements and a user's personal situation. Use when a college student or early-career applicant lacks directly related project experience and wants Codex to analyze a job screenshot/JD/recruiter requirement, understand the role's ability signals, match them with the applicant's skills, constraints, and goals, then produce a small buildable AI/full-stack/frontend/backend/data demo project plus a complete Codex-ready project prompt, resume bullet, HR message, and demo script.
---

# JD to Demo Workflow

Use this skill to convert a target internship opportunity and applicant context into a buildable job-seeking demo:

```text
recruitment requirements -> ability signals -> applicant fit/gap -> project strategy -> Codex project prompt -> HR/resume materials
```

Default to Chinese output when the user writes in Chinese.

## Workflow

1. Parse the job source:
   - If the user provides a screenshot/photo, extract visible role, company, salary/location, responsibilities, requirements, keywords, and uncertain text.
   - If the user provides pasted JD text, parse it directly.
   - If job information is incomplete, continue with explicit assumptions and list missing fields.
2. Capture applicant context:
   - year/major/school if provided
   - target role and urgency
   - current tech stack
   - project experience
   - available time
   - desired positioning, such as AI application, full-stack, frontend, backend, or product-minded engineer
3. Convert recruitment requirements into ability signals, proof artifacts, and priority levels.
4. Match ability signals against the applicant's current situation:
   - what they can already prove
   - what they need the demo to prove
   - what is unrealistic for their time/skill level
   - what can be safely mocked or scoped down
5. Choose a demo strategy, or ask the user to choose if multiple options are equally good:
   - recruiting
   - customer-support
   - education
   - operations
   - fullstack-dashboard
   - generic-ai-workbench
   - role-specific custom project
6. Produce a 1-3 day MVP, not a broad platform.
7. Generate a complete Codex-ready project prompt with strict scope, pages, APIs, data model, UI states, API-key rules, mock mode, README requirements, and acceptance criteria.
8. Include resume bullet and HR/BOSS message.
9. Warn when the scope is too large for a fast demo.

## Required Response Contract

When producing the final answer, use this order:

1. **Job source extraction**
   - Visible facts from screenshot/text
   - Inferences clearly labeled
   - Missing or uncertain fields
2. **Recruitment demand understanding**
   - Hard skills
   - Hidden ability signals
   - Priority requirements
   - Best proof artifacts
3. **Applicant profile and goals**
   - What the applicant already has
   - What they need to prove
   - Time budget and positioning
   - Fit/gap against the role
4. **Demo project strategy**
   - Recommended demo type
   - Why this project matches the job
   - MVP scope and non-goals
5. **Complete Codex project prompt**
   - This is the primary output
   - Make it self-contained
   - Include constraints, pages, APIs, data model, AI behavior, mock/API-key rules, UI states, deliverables, and acceptance criteria
6. **Application materials**
   - Resume bullet
   - HR/BOSS message
   - 90-second demo script when useful

Do not stop at advice. The user should be able to copy the Codex project prompt into a new thread and start building immediately.
When the user writes in Chinese, translate the section labels into natural Chinese in the final response.

## Reference Routing

- Read `references/screenshot-analysis.md` when the job source is an image, screenshot, photo, or partial visual capture.
- Read `references/applicant-context.md` when the user provides personal background, constraints, school year, skill stack, or desired positioning.
- Read `references/requirement-matching.md` when converting recruitment requirements into ability evidence and project choices.
- Read `references/project-generation.md` when deciding the smallest job-relevant project scope and deliverables.
- Read `references/demo-types.md` when choosing or comparing demo directions.
- Read `references/output-format.md` when producing the final brief.
- Read `references/api-patterns.md` when the user asks about API design, LLM API integration, environment variables, or implementation prompts.
- Read `references/codex-prompt.md` when generating the final prompt for another Codex session to build the project.
- Read `references/examples.md` when you need a concrete example of the expected user request and output shape.

## API Guidance

Do not suggest hardcoding API keys. Prefer:

- `.env` / `.env.local`
- `.env.example`
- OpenAI-compatible client configuration
- mock mode or sample outputs when no API key is available
- server-side API calls instead of exposing keys in browser code

If the user asks whether a skill can solve the API problem, explain:

- A skill can standardize the API plan, prompts, endpoint design, and coding instructions.
- A skill cannot magically provide credentials or safely hide a key in a static-only frontend.
- For a real deployed app, use a backend/proxy or serverless route that reads API keys from environment variables.

## Output Priority

For this workflow, the most important artifact is the final Codex prompt. Make it complete enough that the user can paste it into a fresh Codex thread and get a working internship demo project without re-explaining the job.

## Quality Bar

- The project must be plausible for the applicant's level.
- The project must not fake employment or internship history.
- The demo must show visible ability, not just claim ability.
- The final prompt must prevent scope creep.
- API keys must never be placed in frontend code.
- If the job screenshot is unclear, preserve uncertainty instead of inventing facts.
