# Examples

## Example user request with screenshot

```text
Use $jd-to-demo-workflow. 这是 BOSS 直聘上一个 AI 应用开发实习岗位截图。
我是大二，想找 AI 应用/全栈实习，会 React、Node.js、Python，会一点 LLM API。
我没有实习经历，希望你帮我生成一个能让 Codex 直接开发的项目提示词，最好 48 小时内能做完。
```

Expected output:

- Extract visible job facts from screenshot.
- Label uncertain screenshot text.
- Map requirements to ability signals.
- Match ability signals with the applicant's current skills and missing proof.
- Recommend one demo project.
- Generate a complete Codex prompt.
- Include resume bullet and HR message.

## Example user request with pasted JD

```text
Use $jd-to-demo-workflow. 岗位要求 React、Node.js、数据库、AI Agent，有完整项目经验优先。
我想把自己包装成偏全栈的 AI 应用开发候选人，项目要能部署，能给 HR 看。
```

Expected strategy:

- Prefer AI + full-stack workflow demo.
- Explain why this project is the best proof for the role and applicant.
- Include frontend pages, backend APIs, database entities, mock AI mode, and deployment notes.
- Make the Codex prompt strict enough to produce a small complete app.

## Mini output shape

```text
1. 岗位信息识别
2. 求职者画像与诉求
3. 项目策略
4. 完整 Codex 项目生成提示词
5. 投递材料
```

The fourth section should be the longest and most concrete.

## Quality baseline

A strong answer must include a full project-generation prompt, not only a recommendation.

The final Codex prompt should be detailed enough to specify:

- background and target role
- recruitment demand and ability signals
- applicant strengths and gaps
- project name and positioning
- MVP features and non-goals
- pages, APIs, and data entities
- AI prompt behavior and JSON schema
- mock mode and API-key safety
- README, `.env.example`, sample data, and acceptance criteria
- resume bullet and HR message
