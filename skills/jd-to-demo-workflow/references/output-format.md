# Output Format

Use this structure when producing route comparison and project-generation outputs.

## Before Route Confirmation

The output should help the user choose, not overwhelm them with a finished implementation plan.

### 1. Recruitment Demand Understanding

- Target role:
- Company/business:
- Hard skills:
- Hidden ability signals:
- P0 requirements:
- P1 differentiators:
- Best proof artifacts:

### 2. Applicant Fit and Gap

- Existing strengths:
- Missing proof:
- Time budget:
- Best positioning:
- What the demo must prove:
- What should be mocked or scoped down:

### 3. Three Project Routes

For each route, use this structure:

```text
Route A/B/C:
- Route type:
- Project name:
- One sentence:
- Product logic:
- Core user flow:
- Why it matches the JD:
- Recommended tech stack:
- MVP features:
- Non-goals:
- Estimated time:
- Main risk:
- Downgrade plan:
- Resume angle:
- HR/BOSS angle:
```

The three route types should usually be:

- Fastest viable build
- Strongest job match
- Strongest technical showcase

### 4. Route Comparison

Use a compact table:

- route
- job match
- build speed
- technical depth
- user explainability
- risk

### 5. Recommendation

Recommend one route and explain why.

End by asking the user to confirm:

```text
你可以选择路线 A/B/C，或者说“把 A 的范围和 B 的业务场景合并”。确认后我会直接进入项目生成阶段。
```

## After Route Confirmation

When the user confirms a route, produce the implementation-ready output.

### 1. Confirmed Project

- Selected route:
- Project name:
- One-sentence positioning:
- Target user:
- Core workflow:
- Scope boundaries:

### 2. Engineering Plan

- Pages:
- API endpoints:
- Data entities:
- AI prompt direction:
- Mock mode:
- Environment variables:
- Deployment plan:

### 3. Codex Build Prompt

Produce a self-contained prompt that the user can paste into a fresh Codex thread if the current session is not directly building the project.

```text
Build a small demo app for [project name].

Context:
- Target role:
- Company/business:
- User:
- Applicant strengths:
- Applicant gaps:
- Confirmed route:
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
- Explain why this stack fits the user's skills, timeline, and role.

AI behavior:
- [prompt direction]
- Use mock AI output if no API key is configured.
- If integrating an LLM API, read the key from environment variables and never expose it in client code.

Deliverables:
- Working local app
- README
- .env.example
- Demo data
- Acceptance criteria
- Resume bullet
- HR message
- 90-second demo script
```

### 4. Resume Bullet

Formula:

```text
Built [project] for [scenario], supporting [feature 1], [feature 2], and [feature 3]; used [stack] to complete [frontend/backend/AI/data/deployment] workflow and demonstrate [target ability].
```

### 5. HR Message

Keep it short:

```text
您好，我是[身份]，正在找[方向]实习。我看了岗位里对[能力]的要求，所以做了一个[项目名] demo，包含[核心功能]。这个项目是根据岗位场景设计的，想用可演示作品更具体地展示我的开发能力。方便的话希望争取一次沟通机会。
```
