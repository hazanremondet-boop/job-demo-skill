# Examples

## Example user request with screenshot

```text
Use $jd-to-demo-workflow.

这是 BOSS 直聘上一个 AI 应用开发实习岗位截图。
我是大二，想找 AI 应用/全栈实习，会 React、Node.js、Python，会一点 LLM API。
我没有实习经历，希望你先帮我分析岗位，然后给我三条项目路线。

请先不要直接生成代码。
每条路线都要说明项目内容、产品逻辑、技术栈、MVP 范围和为什么适合这个岗位。
等我确认路线后，再帮我生成完整项目。
```

Expected output before confirmation:

- Extract visible job facts from screenshot.
- Label uncertain screenshot text.
- Map requirements to ability signals.
- Match ability signals with the applicant's current skills and missing proof.
- Produce three routes:
  - fastest viable build
  - strongest job match
  - strongest technical showcase
- Recommend one route.
- Ask for route confirmation.
- Include resume/HR angle for each route.

## Example user request with pasted JD

```text
Use $jd-to-demo-workflow.

岗位要求 React、Node.js、数据库、AI Agent，有完整项目经验优先。
我想把自己定位成偏全栈的 AI 应用开发候选人，项目要能部署，能给 HR 看。
请先给我三条路线，不要直接开写。
```

Expected strategy:

- Compare AI + full-stack workflow routes.
- Make the routes meaningfully different in build speed, job relevance, and technical depth.
- Explain which route best proves the role's requirements and why.
- Ask the user to confirm before producing full implementation.

## Example confirmed-route request

```text
我选路线 B：岗位命中路线。
请直接生成完整项目，包含 README、mock 数据、.env.example、验收标准、简历 bullet 和 HR 话术。
```

Expected output after confirmation:

- Restate the selected route.
- Generate code when working inside a workspace.
- Otherwise produce a complete Codex-ready build prompt.
- Include frontend pages, backend APIs, database entities, mock AI mode, API-key safety, and acceptance criteria.
- Include resume bullet, HR message, and 90-second demo script.

## Mini output shape before confirmation

```text
1. 岗位信息识别
2. 求职者画像与 fit/gap
3. 三条项目路线
4. 路线对比
5. 推荐路线
6. 等待用户确认
```

## Mini output shape after confirmation

```text
1. 已确认路线
2. 项目目标和边界
3. 工程实现计划
4. Codex 构建提示词或直接生成代码
5. 求职材料
```

## Quality baseline

A strong answer before confirmation must help the user make a project decision.

A strong answer after confirmation must be detailed enough to build:

- background and target role
- recruitment demand and ability signals
- applicant strengths and gaps
- selected route and reason
- project name and positioning
- MVP features and non-goals
- pages, APIs, and data entities
- AI prompt behavior and JSON schema
- mock mode and API-key safety
- README, `.env.example`, sample data, and acceptance criteria
- resume bullet and HR message
