# Skill Forward Test Expected Output

这份文件是 `$jd-to-demo-workflow` 在 `examples/skill-forward-test.md` 输入下的合格输出样例。

它不是唯一答案，但代表输出质量下限：必须能让用户复制“完整 Codex 项目生成提示词”到新线程并开始开发。

## 1. 岗位信息识别

可见事实：

- 岗位：AI 应用开发实习生
- 公司业务：企业招聘 SaaS / HRTech
- 方向：AI 应用 + 全栈开发
- 职责：参与 AI 应用产品开发、实现前后端功能、接入大模型能力、支持知识库问答/简历解析/候选人匹配、优化 prompt 和用户体验
- 要求：React/Vue、Node.js/Python、LLM API、RAG、Prompt Engineering、完整项目或可展示 demo

推断：

- 这个岗位关注“AI 能力是否能落到真实业务流程”，不是只会做聊天框。
- 最适合的 demo 应该贴近招聘场景，同时体现前端、后端、AI prompt、数据结构和展示材料。

不确定项：

- 截图没有提供团队规模、具体技术栈版本、部署要求和是否必须 RAG。

## 2. 求职者画像与诉求

- 求职者：大二学生
- 目标：AI 应用 / 全栈工程师实习
- 已有能力：React、Node.js、Python、LLM API 基础
- 当前短板：没有正式实习经历
- 核心诉求：48 小时内做出能给 HR 看、能写进简历、能由 Codex 直接开发的项目 demo
- 关键限制：不要把 API key 写进前端

## 3. 项目策略

推荐项目：

```text
AI JD 分析与候选人匹配助手
```

一句话定位：

```text
面向 HR/招聘运营的 AI 招聘分析工作台，输入岗位 JD 和候选人材料，输出岗位能力标签、匹配评分、风险点、面试问题和可复制评估报告。
```

为什么适配岗位：

- 对应“简历解析、候选人匹配”业务关键词。
- 对应“LLM API、RAG、Prompt Engineering”AI 应用要求。
- 对应“React/Vue、Node.js/Python”前后端要求。
- 可通过可操作页面、API、数据结构、mock 模式和 README 证明完整项目经验。

MVP 必做：

- JD 输入与解析
- 候选人/项目材料输入
- 能力标签提取
- 匹配评分与解释
- 面试问题生成
- 可复制评估报告
- 示例数据一键填充

明确不做：

- 不做真实招聘系统
- 不做账号权限
- 不做真实简历文件上传解析
- 不做复杂 RAG 向量库，除非 72 小时以上
- 不做自动投递

## 招聘需求理解与个人情况匹配 (recruitment demand + applicant situation)

招聘方真正想看到的能力证据：

| 招聘要求 | 能力信号 | demo 证据 | 优先级 |
| --- | --- | --- | --- |
| React/Vue | 能实现可用前端界面 | 招聘分析工作台、结构化结果页、历史记录区 | P0 |
| Node.js/Python | 能完成后端接口和业务流程 | `/api/analyze-job`、`/api/match-candidate`、报告接口 | P0 |
| LLM API / Prompt | 能把大模型接入真实业务 | 岗位解析、匹配评分、面试题生成、JSON 输出 | P0 |
| RAG / 知识库 | 有 AI 应用扩展意识 | 可选的引用来源/知识片段模块 | P1 |
| 完整项目经验 | 能交付闭环 demo | README、示例数据、mock 模式、截图清单、演示脚本 | P0 |

个人情况匹配：

- 已有 React、Node.js、Python 和 LLM API 基础，适合做 AI + 全栈小项目。
- 没有实习经历，所以项目必须强调“可见交付物”，而不是包装不存在的经历。
- 48 小时时间限制下，应该先用 mock AI 跑通闭环，再保留真实 API 接入接口。
- 最能补短板的项目不是通用聊天机器人，而是招聘业务场景下的 AI 分析工作台。

## 4. 完整 Codex 项目生成提示词

```text
你是 Codex，请帮我开发一个用于实习求职展示的 demo 项目。

背景：
- 我是大二学生，正在找 AI 应用 / 全栈工程师实习。
- 我会 React、Node.js、Python，了解 LLM API，但没有正式实习经历。
- 目标岗位是 AI 应用开发实习生。
- 目标公司业务是企业招聘 SaaS / HRTech。
- 岗位要求包括 React/Vue、Node.js/Python、LLM API、RAG、Prompt Engineering、AI 应用开发、简历解析、候选人匹配、可展示 demo。
- 我想证明自己能把 AI 能力接入真实业务流程，并完成一个前后端闭环项目。

项目目标：
- 项目名称：AI JD 分析与候选人匹配助手
- 一句话定位：面向 HR/招聘运营的 AI 招聘分析工作台，输入岗位 JD 和候选人材料，输出岗位能力标签、匹配评分、风险点、面试问题和可复制评估报告。
- 目标用户：HR、招聘运营、面试官
- 核心输入：岗位 JD、候选人简历文本、候选人项目描述
- 核心输出：岗位能力标签、匹配评分、能力证据、短板建议、面试问题、评估报告

技术栈：
- 前端：React + TypeScript + Vite
- 后端：Node.js + Express
- 数据：本地 JSON 或 SQLite，优先保证 48 小时内可完成
- AI：先实现 mock AI 输出；如果接入真实 LLM API，通过后端读取环境变量

功能范围：
- 必做：
  1. 首页就是可用工作台，不做营销 landing page。
  2. 支持输入岗位 JD。
  3. 支持输入候选人材料。
  4. 支持一键填充示例数据。
  5. 点击分析后生成结构化结果。
  6. 结果包含能力标签、匹配评分、匹配理由、风险点、面试问题和可复制报告。
  7. 支持保存最近分析历史。
  8. 支持复制报告文本。
  9. 提供 README、.env.example、示例数据。
- 可选：
  1. 增加简单图表展示能力覆盖情况。
  2. 增加导出 Markdown 报告。
- 明确不做：
  1. 不做账号系统。
  2. 不做真实文件上传。
  3. 不做真实投递。
  4. 不做复杂权限。
  5. 不把 API key 写进前端代码。

页面：
- 工作台页面：
  - 左侧为 JD 和候选人材料输入区
  - 右侧为分析结果区
  - 顶部显示项目名和当前岗位场景
- 历史记录区域：
  - 展示最近几次分析
  - 可点击查看历史报告
- 设置/说明区域：
  - 展示 mock 模式和真实 API 模式说明

API：
- POST /api/analyze-job
  - 输入：jobDescription
  - 输出：roleSummary, abilityTags, requiredSkills, hiddenRequirements
- POST /api/match-candidate
  - 输入：jobDescription, candidateText, projectText
  - 输出：score, evidence, gaps, suggestions, interviewQuestions, report
- GET /api/reports
  - 输出：历史报告列表
- GET /api/reports/:id
  - 输出：单个报告详情

数据结构：
- Job
  - id
  - company
  - role
  - description
  - requiredSkills
  - hiddenRequirements
- Candidate
  - id
  - name
  - resumeText
  - projectText
  - strengths
- MatchReport
  - id
  - jobId
  - candidateId
  - score
  - abilityTags
  - evidence
  - gaps
  - suggestions
  - interviewQuestions
  - reportMarkdown
  - createdAt

AI 能力：
- Prompt 方向：
  - 你是招聘场景下的 AI 应用分析助手。
  - 请根据岗位 JD 和候选人材料，提取岗位能力要求，判断候选人匹配度，并输出可解释的评估报告。
- 输出 JSON schema：
  {
    "roleSummary": "",
    "abilityTags": [],
    "score": 0,
    "evidence": [],
    "gaps": [],
    "suggestions": [],
    "interviewQuestions": [],
    "reportMarkdown": ""
  }
- Mock 模式：
  - 默认使用 mockAnalyzeCandidate 函数返回固定结构化结果。
  - 没有 API key 时，完整流程仍然可演示。
- API key 限制：
  - 如果接入真实 LLM API，只能在后端/serverless route 读取环境变量。
  - 使用 LLM_API_KEY、LLM_BASE_URL、LLM_MODEL。
  - 不要把 key 写进前端代码。
  - 提供 .env.example。

UI/交互要求：
- 界面要像一个招聘分析工作台，信息密度适中，专业、清晰。
- 不做夸张营销页。
- 必须有空状态、loading 状态、错误状态。
- 分析结果要结构化展示，不要只显示一段聊天文本。
- 报告内容要可以复制。

交付物：
- 可运行代码
- README
- .env.example
- 示例数据
- 截图清单
- 简历 bullet
- HR 消息

验收标准：
- 启动项目后，用户能在首页直接看到核心工作台。
- 用户能一键填充示例 JD 和候选人材料。
- 点击分析后，页面展示结构化匹配报告。
- 没有配置 API key 时，mock 模式仍能完整演示。
- 结果包含能力标签、评分、证据、短板、建议、面试问题和可复制报告。
- README 说明项目定位、运行方式、技术栈、环境变量和为什么匹配目标岗位。
- 项目范围控制在 48 小时内可完成。

最后请在 README 中附上：
- 简历 bullet
- HR 消息
- 90 秒演示脚本
```

## 5. 投递材料

简历 bullet：

```text
面向招聘 SaaS 场景独立开发 AI JD 分析与候选人匹配助手，支持岗位 JD 解析、能力标签提取、候选人匹配评分、短板建议和面试问题生成；使用 React + TypeScript + Node.js 完成前端工作台、后端 API、结构化 AI 输出和 mock/真实 API 双模式设计，用于展示 AI 应用落地和全栈开发能力。
```

HR 消息：

```text
您好，我是大二学生，正在找 AI 应用/全栈方向实习。我看到岗位里提到 AI 应用开发、LLM API、简历解析和候选人匹配，所以做了一个 AI JD 分析与候选人匹配 demo，包含 JD 解析、匹配评分、面试问题生成和可复制评估报告。希望用这个可演示项目更具体地展示我的开发能力，方便的话想争取一次沟通机会。
```

90 秒演示脚本：

```text
这个项目是面向招聘 SaaS 场景的 AI JD 分析与候选人匹配助手。左侧输入岗位 JD 和候选人材料，也可以一键填充示例数据。点击分析后，系统会输出岗位能力标签、候选人匹配评分、匹配证据、短板建议和面试问题。整个结果可以复制成评估报告。技术上我用 React 做工作台界面，用 Node.js 设计 API，并设计了 mock AI 和真实 LLM API 两种模式，真实 key 只会通过后端环境变量读取。这个项目主要对应岗位里的 AI 应用落地、前后端开发、Prompt Engineering 和可展示项目经验要求。
```
