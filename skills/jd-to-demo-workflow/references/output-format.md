# Output Format

Use this structure for the final brief. The output should prove that the project is chosen from both recruitment demand and applicant situation.

## Recruitment Demand Understanding

- Target role:
- Company/business:
- Hard skills:
- Hidden ability signals:
- P0 requirements:
- P1 differentiators:
- Best proof artifacts:

## Applicant Fit and Gap

- Existing strengths:
- Missing proof:
- Time budget:
- Best positioning:
- What the demo must prove:
- What should be mocked or scoped down:

## Positioning

- Project name:
- One sentence: For [user], this [product type] helps [task] by producing [result].
- Why it matches the JD:

## Ability Signals

Table columns:

- JD requirement
- Ability signal
- Demo proof
- Priority

## MVP

- Core flow:
- Features:
- Non-goals:
- 24/48/72 hour plan:

## Engineering Plan

- Pages:
- API endpoints:
- Data entities:
- AI prompt direction:
- Deployment plan:

## Codex Project Prompt

Produce a self-contained prompt that the user can paste into a fresh Codex thread. It must include job facts, applicant context, recruitment-demand reasoning, scope limits, API-key rules, mock mode, and acceptance criteria.

```text
Build a small demo app for [project name].

Context:
- Target role:
- Company/business:
- User:
- Applicant strengths:
- Applicant gaps:
- Core problem:
- Role ability signals to prove:

Requirements:
- Implement [features].
- Create pages: [pages].
- Create APIs: [endpoints].
- Use data entities: [entities].
- Add mock data and empty/loading/error states.
- Keep scope suitable for a 1-3 day internship demo.

Tech stack:
- [stack]

AI behavior:
- [prompt direction]
- Use mock AI output if no API key is configured.
- If integrating an LLM API, read the key from environment variables and never expose it in client code.

Deliverables:
- Working local app
- README
- .env.example
- Demo data
- Resume bullet
- HR message
```

## Resume Bullet

Formula:

```text
Built [project] for [scenario], supporting [feature 1], [feature 2], and [feature 3]; used [stack] to complete [frontend/backend/AI/data/deployment] workflow and demonstrate [target ability].
```

## HR Message

Keep it short:

```text
您好，我是大二学生，正在找 [方向] 实习。我看了岗位里对 [能力] 的要求，所以做了一个 [项目名] demo，包含 [核心功能]，想用可演示项目更具体地展示我的开发能力。方便的话想争取一次沟通机会。
```
