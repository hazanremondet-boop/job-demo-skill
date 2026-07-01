# Skill Forward Test Expected Output

这份文件是 `$jd-to-demo-workflow` 在 `examples/skill-forward-test.md` 输入下的合格输出样例。

它不是唯一答案，但代表输出质量下限：在用户确认前，必须能清楚比较三条路线；用户确认后，才进入完整 Codex 项目生成。

## 1. 岗位信息识别

可见事实：

- 岗位：AI 应用开发实习生
- 公司业务：企业招聘 SaaS / HRTech
- 方向：AI 应用 + 全栈开发
- 职责：AI 应用开发、前后端功能实现、大模型能力接入、知识库问答、简历解析、候选人匹配、prompt 和用户体验优化
- 要求：React/Vue、Node.js/Python、LLM API、RAG、Prompt Engineering、完整项目或可展示 demo

推断：

- 这个岗位关注 AI 能力是否能落到真实招聘业务流程。
- 最合适的 demo 应该贴近 HRTech 场景，而不是通用聊天机器人。

不确定项：

- 截图没有提供团队规模、具体技术栈版本、部署要求和是否必须真实 RAG。

## 2. 招聘需求理解 recruitment demand

招聘方真正想看到的能力证据：

| 招聘要求 | 能力信号 | demo 证据 | 优先级 |
| --- | --- | --- | --- |
| React/Vue | 能实现可用前端界面 | 招聘分析工作台、结果页、历史记录区 | P0 |
| Node.js/Python | 能完成后端接口和业务流程 | `/api/analyze-job`、`/api/match-candidate` | P0 |
| LLM API / Prompt | 能把大模型接入真实业务 | JD 解析、匹配评分、面试题生成、JSON 输出 | P0 |
| RAG / 知识库 | 有 AI 应用扩展意识 | 可选知识片段或岗位要求引用模块 | P1 |
| 完整项目经验 | 能交付闭环 demo | README、mock 模式、示例数据、演示脚本 | P0 |

## 3. 求职者画像 applicant situation

- 求职者：大二学生
- 目标：AI 应用 / 全栈工程师实习
- 已有能力：React、Node.js、Python、LLM API 基础
- 当前短板：没有正式实习经历
- 核心诉求：48 小时内做出能给 HR 看、能写进简历、能由 Codex 生成的项目 demo
- 关键限制：API key 不能写进前端

匹配判断：

- 适合做 AI + 全栈小项目。
- 应优先选择招聘业务场景，而不是泛泛的 AI 助手。
- 48 小时限制下，默认使用 Mock AI，保留真实 LLM API 接入位置。

## 4. 三条项目路线

### 路线 A：最快落地路线

- 项目名：AI JD 能力标签分析器
- 项目内容：输入岗位 JD，输出能力标签、优先级、简历表达建议和 HR 话术。
- 产品逻辑：把 JD 拆成岗位能力信号，再生成用户可用的求职材料。
- 核心流程：粘贴 JD -> 点击分析 -> 查看能力标签 -> 复制简历 bullet / HR 消息。
- 技术栈：React + TypeScript + Vite，默认 Mock AI。
- MVP 范围：单页面、示例 JD、一键分析、复制结果、README。
- 风险：技术展示深度较弱。
- 降级方案：不做后端，先静态前端跑通。
- 求职表达：证明能把 AI 用在真实求职/招聘文本分析中。

### 路线 B：岗位命中路线

- 项目名：AI JD 分析与候选人匹配助手
- 项目内容：输入岗位 JD 和候选人材料，输出能力标签、匹配评分、证据、短板、面试题和可复制评估报告。
- 产品逻辑：模拟 HRTech 产品中的候选人初筛和岗位匹配流程。
- 核心流程：输入 JD -> 输入候选人材料 -> AI 分析 -> 生成匹配报告 -> 保存/复制报告。
- 技术栈：React + TypeScript + Node.js + Express + 本地 JSON/SQLite。
- MVP 范围：工作台页面、分析 API、匹配 API、报告历史、Mock AI、`.env.example`。
- 风险：范围比路线 A 稍大，需要控制历史记录和报告格式。
- 降级方案：先用本地 JSON 存储，暂不做真实数据库和登录。
- 求职表达：最贴合招聘 SaaS / HRTech 岗位，能展示 AI 应用落地、前后端协作和 Prompt Engineering。

### 路线 C：技术展示路线

- 项目名：AI 招聘分析全栈工作台
- 项目内容：在路线 B 基础上增加结构化 JSON schema、报告历史、可选真实 LLM API、错误状态、图表和部署说明。
- 产品逻辑：构建一个更完整的 AI 招聘分析工作台，突出工程结构和可扩展性。
- 核心流程：配置 mock/真实 API -> 分析 JD 和候选人 -> 查看结构化报告 -> 查看历史趋势。
- 技术栈：React + TypeScript + Node.js + Express + SQLite + LLM API 环境变量。
- MVP 范围：前后端分离、API endpoints、SQLite、JSON schema、mock/真实 API 双模式、README、部署说明。
- 风险：48 小时内完成压力较高。
- 降级方案：图表和部署放到可选项，优先保证主流程。
- 求职表达：适合面试时展开讲 API 设计、数据结构、AI 输出约束、mock 模式和 API key 安全。

## 5. 路线对比

| 路线 | 岗位命中 | 构建速度 | 技术深度 | 可解释性 | 风险 |
| --- | --- | --- | --- | --- | --- |
| A 最快落地 | 中 | 高 | 低-中 | 高 | 低 |
| B 岗位命中 | 高 | 中 | 中 | 高 | 中 |
| C 技术展示 | 中-高 | 低-中 | 高 | 中 | 高 |

推荐路线：路线 B。

原因：它最符合招聘 SaaS / HRTech 的业务场景，也能在 48 小时内通过 React、Node.js、API、JSON、Mock AI 和 README 做出完整闭环。

## 6. 等待用户确认

建议用户确认：

```text
我建议选择路线 B：AI JD 分析与候选人匹配助手。
如果你确认，我下一步会基于路线 B 生成完整 Codex 项目构建提示词，或在当前工作区直接生成项目代码。
```

## 7. 用户确认后的 Codex 构建提示词应包含

如果用户确认路线 B，完整 Codex 构建提示词必须包含：

- 背景：大二，找 AI 应用/全栈实习。
- 目标岗位：AI 应用开发实习生。
- 公司业务：招聘 SaaS / HRTech。
- 选择路线：岗位命中路线。
- 项目名称：AI JD 分析与候选人匹配助手。
- 技术栈：React + TypeScript + Node.js + Express + JSON/SQLite。
- 页面列表。
- API endpoints。
- 数据结构。
- AI 行为和输出 JSON schema。
- Mock AI 输出。
- API key 只能由后端或 serverless route 读取。
- README、`.env.example`、示例数据。
- 空状态、loading 状态、错误状态。
- 验收标准。
- 简历 bullet。
- HR 消息。

## 8. 确认后的求职材料示例

简历 bullet：

```text
面向招聘 SaaS 场景独立开发 AI JD 分析与候选人匹配助手，支持岗位 JD 解析、能力标签提取、候选人匹配评分、短板建议和面试题生成；使用 React + TypeScript + Node.js 完成前端工作台、后端 API、结构化 AI 输出和 mock/真实 API 双模式设计，用于展示 AI 应用落地和全栈开发能力。
```

HR 消息：

```text
您好，我是大二学生，正在找 AI 应用/全栈方向实习。我看到岗位里提到 AI 应用开发、LLM API、简历解析和候选人匹配，所以做了一个 AI JD 分析与候选人匹配 demo，包含 JD 解析、匹配评分、面试题生成和可复制评估报告。希望用这个可演示项目更具体地展示我的开发能力，方便的话想争取一次沟通机会。
```
