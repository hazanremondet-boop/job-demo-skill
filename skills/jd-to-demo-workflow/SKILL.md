---
name: jd-to-demo-workflow
description: Help college students and early-career applicants turn job screenshots, JDs, and recruiter requirements into confirmed, buildable portfolio projects. Use when Codex should analyze the role, match it with the applicant's background, propose three project routes with different tradeoffs (fastest viable build, strongest job match, strongest technical showcase), wait for or incorporate the user's route confirmation, then quickly generate the selected AI/full-stack/frontend/backend/data demo project plus README, mock data, resume bullet, HR message, and demo script.
---

# JD to Demo Workflow

Use this skill to convert a target internship opportunity and applicant context into a confirmed, buildable job-seeking demo:

```text
recruitment requirements -> ability signals -> applicant fit/gap -> three project routes -> user confirmation -> project generation -> HR/resume materials
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
5. Propose three routes by default unless the user has already chosen a direction:
   - **Fastest viable build**: the simplest 1-2 day project that can run, demo, and be sent to HR.
   - **Strongest job match**: the project that best reflects the target company's business and the JD's highest-priority ability signals.
   - **Strongest technical showcase**: the project that best demonstrates engineering depth, API/database/AI integration, deployment readiness, or system design.
6. For each route, specify project content, product logic, target user flow, MVP scope, recommended tech stack, why the stack fits, non-goals, estimated time, risks, resume angle, and HR/demo angle.
7. If the user has not confirmed a route, stop after the route comparison and ask them to choose one route or combine parts of routes. Do not generate full code yet.
8. If the user confirms a route in the current request or a previous turn, generate the selected project directly. Include runnable code or a complete Codex-ready build prompt depending on whether the current workspace is available for implementation.
9. Include README requirements, mock data, environment variable rules, API-key rules, acceptance criteria, resume bullet, HR/BOSS message, and demo script.
10. Warn when the confirmed scope is too large for a fast demo.

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
4. **Three project routes**
   - Fastest viable build
   - Strongest job match
   - Strongest technical showcase
   - For each route: project content, product logic, user flow, tech stack, MVP scope, non-goals, time estimate, risk, resume/HR angle
5. **Route recommendation and confirmation request**
   - Recommend one route for the applicant and explain why
   - Ask the user to confirm a route before full project generation when no route has been confirmed
6. **Confirmed project generation**
   - Include this section only after the user confirms a route, or when the user explicitly asks to build immediately
   - Generate runnable project code when operating in a workspace and the user asks for implementation
   - Otherwise generate a self-contained Codex-ready build prompt with constraints, pages, APIs, data model, AI behavior, mock/API-key rules, UI states, deliverables, and acceptance criteria
7. **Application materials**
   - Resume bullet
   - HR/BOSS message
   - 90-second demo script when useful

Do not frame the skill as a passive project-plan generator. It is a route-selection and project-generation workflow.
Before route confirmation, the primary output is a high-quality route comparison that helps the user decide.
After route confirmation, do not stop at advice. Generate the selected project or a complete prompt that another Codex session can use to build it immediately.
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

For this workflow, the most important artifact before confirmation is the three-route comparison.
After confirmation, the most important artifact is the generated project or final Codex build prompt. Make it complete enough that the user can paste it into a fresh Codex thread and get a working internship demo project without re-explaining the job.

## Quality Bar

- The project must be plausible for the applicant's level.
- The project must not fake employment or internship history.
- The demo must show visible ability, not just claim ability.
- The three routes must have real tradeoffs, not three names for the same project.
- The tech stack recommendation must be tied to the user's skills, timeline, and the role's proof needs.
- The final prompt must prevent scope creep.
- API keys must never be placed in frontend code.
- If the job screenshot is unclear, preserve uncertainty instead of inventing facts.
