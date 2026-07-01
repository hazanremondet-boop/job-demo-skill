# Skill Forward Test: BOSS Job Screenshot to Codex Prompt

这个样例用于测试 `$jd-to-demo-workflow` 是否能把岗位截图/OCR 和求职者诉求转换成完整 Codex 项目生成提示词。

## 输入

```text
Use $jd-to-demo-workflow.

下面是一个 BOSS 直聘岗位截图 OCR 出来的内容：

岗位：AI 应用开发实习生
公司业务：企业招聘 SaaS / HRTech
职责：
1. 参与 AI 应用产品开发，负责前后端功能实现。
2. 接入大模型能力，支持知识库问答、简历解析、候选人匹配等场景。
3. 与产品和后端同学协作，优化 prompt 和用户体验。
要求：
1. 熟悉 React 或 Vue。
2. 了解 Node.js 或 Python。
3. 了解 LLM API、RAG、Prompt Engineering。
4. 有完整项目经验或可展示 demo 优先。

我的背景：
- 大二
- 正在找 AI 应用 / 全栈工程师实习
- 会 React、Node.js、Python，了解 LLM API
- 没有正式实习经历

我的诉求：
- 希望生成一个 48 小时内能完成的求职 demo 项目
- 项目要能给 HR 看
- 要能写进简历
- 要让 Codex 可以直接根据提示词开发
- 不要把 API key 写进前端
```

## 期望输出结构

skill 的回答应该包含：

1. 岗位信息识别
2. 求职者画像与诉求
3. 项目策略
4. 完整 Codex 项目生成提示词
5. 投递材料

## 期望项目策略

推荐项目可以是：

```text
AI JD 分析与候选人匹配助手
```

或者类似的招聘场景 AI + 全栈 demo。

必须体现：

- 岗位 JD 解析
- 能力标签提取
- 候选人/项目材料匹配评分
- 面试题生成或评估报告
- 前端页面、后端 API、数据结构、AI prompt
- mock 模式和环境变量 API key 约束

## 期望 Codex Prompt 必含内容

完整 Codex 项目生成提示词必须包含：

- 背景：我是大二，找 AI 应用/全栈实习。
- 目标岗位：AI 应用开发实习生。
- 公司业务：招聘 SaaS / HRTech。
- 项目名称和一句话定位。
- 必做功能和明确不做的范围。
- 页面列表。
- API endpoints。
- 数据结构。
- AI 行为和输出 JSON schema。
- mock AI 输出。
- API key 只允许后端/serverless 读取。
- README、`.env.example`、示例数据。
- 空状态、loading 状态、错误状态。
- 验收标准。
- 简历 bullet。
- HR 消息。

## 不合格输出

如果 skill 只输出以下内容，就算不合格：

- 只给项目建议，没有完整 Codex prompt。
- 只说“做一个 AI 助手”，没有页面/API/数据结构。
- 没有处理 API key 安全问题。
- 伪造实习经历。
- 项目范围大到 48 小时做不完。
- 没有 HR 话术和简历表达。

