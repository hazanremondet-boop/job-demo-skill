# Codex Project Prompt

Use this format when generating the final prompt for another Codex session.

The prompt must be self-contained. A fresh Codex session should not need the original screenshot.

## Required sections

```text
你是 Codex，请帮我开发一个用于实习求职展示的 demo 项目。

背景：
- 我是：
- 目标岗位：
- 公司/业务：
- 岗位要求摘要：
- 我想证明的能力：

项目目标：
- 项目名称：
- 一句话定位：
- 目标用户：
- 核心输入：
- 核心输出：

功能范围：
- 必做：
- 可选：
- 明确不做：

页面：
- 

API：
- 

数据结构：
- 

AI 能力：
- Prompt 方向：
- 输出 JSON schema：
- Mock 模式：
- API key 限制：

技术栈：
-

UI/交互要求：
- 

交付物：
- 可运行代码
- README
- .env.example
- 示例数据
- 截图清单
- 简历 bullet
- HR 消息

验收标准：
- 
```

## Constraints

Always include these constraints unless the user says otherwise:

- Keep scope suitable for a 1-3 day internship demo.
- Do not create fake work experience.
- Do not hardcode API keys.
- If no API key is available, implement mock AI output first.
- Prefer one complete workflow over many shallow features.
- Include empty/loading/error states.
- Include sample data that matches the job scenario.
- Include README instructions that a recruiter or interviewer can understand.
- Do not build a landing page first; build the usable demo as the first screen.
- Keep the UI professional and job-relevant, not decorative.
- Avoid features that require real paid services unless a mock fallback exists.
- Do not ask the user for more choices during implementation unless blocked.

## API key wording

Use:

```text
如果接入真实 LLM API，请通过后端/serverless route 读取环境变量，例如 LLM_API_KEY、LLM_BASE_URL、LLM_MODEL。不要把 key 写进前端代码。没有 key 时先使用 mock 数据和 mock AI 输出。
```

## Acceptance criteria examples

- User can paste a JD or sample business text.
- App produces structured analysis.
- Result can be copied or exported.
- History is saved locally or in a lightweight database.
- README explains why the demo matches the target role.
- HR message and resume bullet are generated.

## Testable acceptance template

Write acceptance criteria like this:

```text
验收标准：
- 启动项目后，用户能在首页直接看到核心工作台。
- 用户能使用示例数据一键填充输入。
- 点击分析后，页面展示结构化结果，而不是只显示一段聊天文本。
- 结果包含岗位/业务相关的解释、建议和可复制内容。
- 没有配置 API key 时，mock 模式仍然能完整演示。
- README 包含运行命令、环境变量说明、项目定位、截图清单和面试讲解点。
```

## Final prompt quality checklist

Before returning the final Codex prompt, verify it includes:

- target role
- applicant context
- project name
- one-sentence positioning
- MVP features
- non-goals
- pages
- API endpoints
- data entities
- AI prompt behavior
- mock/API-key rules
- UI states
- deliverables
- acceptance criteria
- resume bullet
- HR message
