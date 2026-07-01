# Job Demo Skill

很多学生投实习时最现实的痛点是：没有项目经历，所以连被看见、被约面试的机会都没有。Job Demo Skill 的目的就是帮学生快速做出一个和目标岗位强相关、能发给 HR、能写进简历、能在面试里讲清楚的作品敲门砖。

Job Demo Skill 是一个面向学生和早期求职者的 Codex Skill：根据招聘 JD、BOSS 直聘截图和个人背景，先帮用户确认项目内容、产品逻辑和技术栈路线，再在用户选定方向后快速生成可运行的求职作品项目。

它承认求职里有一部分是策略问题：学生不一定缺潜力，缺的是一个能让招聘方愿意点开、愿意聊下去的证据。这个 skill 做的就是用更聪明、更贴岗位的方式补齐作品证据，把“我会一点技术”变成“我已经围绕你们岗位做了一个可演示的小项目”。它可以很功利、很现实，但边界很清楚：不伪造实习经历，只做真实可打开、可解释、可继续迭代的项目敲门砖。

这个项目不只是“生成项目方案”。它更像一个求职项目共创工作流：先判断岗位真正想验证什么能力，给出三条不同取向的项目路线，帮用户选出最适合自己、最能打动岗位的一条，然后让 Codex 直接进入实现阶段。

## 核心定位

```text
岗位要求 + 个人背景
-> 能力信号拆解
-> 三条项目路线
-> 用户确认项目内容、逻辑、技术栈
-> Codex 快速生成项目
-> 简历亮点、HR 话术、演示脚本
```

## 适合谁使用

- 大二、大三、研一、转专业或早期求职者，缺少强相关实习经历。
- 想投 AI 应用、全栈、前端、后端、数据、运营工具、教育科技、招聘科技等岗位。
- 不知道该做什么项目才能贴合目标岗位。
- 害怕项目范围太大、技术栈选错、做出来和岗位没关系。
- 想让 Codex 在确认方向后直接生成可运行、可演示、可写进简历的项目。

## 它具体做什么

输入岗位 JD、截图、个人背景和时间预算后，skill 会先输出三条项目路线，而不是直接拍脑袋开做：

- **路线 A：最快落地路线**  
  适合 1-2 天内做出可演示 MVP，优先保证能跑、能讲、能发给 HR。

- **路线 B：岗位命中路线**  
  最大化贴合 JD 里的核心业务和能力信号，适合冲目标岗位。

- **路线 C：技术展示路线**  
  更强调技术栈、工程结构、AI/API/数据库/部署闭环，适合面试时展开讲。

每条路线都会包含：

- 项目名称和一句话定位。
- 它对应岗位里的哪些能力要求。
- 核心用户流程和产品逻辑。
- MVP 页面、功能、数据结构和接口。
- 推荐技术栈和原因。
- 哪些功能必须做，哪些功能明确不做。
- 预估开发时间和风险。
- 简历 bullet、HR/BOSS 话术和演示重点。

用户确认路线后，Codex 可以继续直接生成项目代码、README、mock 数据、环境变量示例和验收清单。

## 推荐 GitHub 描述

中文：

```text
根据岗位要求生成三条求职项目路线，并在确认后用 Codex 快速构建可运行作品。
```

英文：

```text
Explore three job-matched project routes, then build the selected portfolio demo with Codex.
```

## 典型使用方式

```text
使用 $jd-to-demo-workflow 分析这个 BOSS 直聘岗位和我的背景。

请先不要直接生成项目代码，先给我三条路线：
1. 最快落地路线
2. 岗位命中路线
3. 技术展示路线

每条路线都要说明项目内容、产品逻辑、技术栈、MVP 范围和适合我的原因。
等我确认其中一条后，再帮我用 Codex 快速生成完整项目。
```

确认路线后可以继续说：

```text
我选路线 B。请基于这个路线直接生成项目，要求包含可运行代码、README、mock 数据、环境变量示例、简历 bullet 和 HR 话术。
```

## 仓库结构

```text
.
|-- README.md
|-- LICENSE
|-- docs/
|   |-- product-prd.md
|   |-- workflow.md
|   |-- delivery-checklist.md
|   |-- skill-usage.md
|   |-- skill-installation.md
|   `-- validation.md
|-- examples/
|   |-- ai-application-intern.md
|   |-- fullstack-intern.md
|   |-- skill-forward-test.md
|   `-- skill-forward-test-expected-output.md
|-- scripts/
|   |-- validate-workflow.ps1
|   `-- check-skill-output.ps1
|-- skills/
|   `-- jd-to-demo-workflow/
|       |-- SKILL.md
|       |-- agents/
|       |   `-- openai.yaml
|       `-- references/
|-- templates/
|   |-- job-intake.md
|   |-- demo-brief.md
|   `-- hr-message.md
`-- tools/
    `-- demo-workflow/
        `-- index.html
```

## 快速开始

### 1. 安装 Skill

Windows：

```powershell
Copy-Item -Recurse -Force `
  ".\skills\jd-to-demo-workflow" `
  "$env:USERPROFILE\.codex\skills\jd-to-demo-workflow"
```

macOS / Linux：

```bash
mkdir -p ~/.codex/skills
cp -R ./skills/jd-to-demo-workflow ~/.codex/skills/jd-to-demo-workflow
```

### 2. 在 Codex 中调用

```text
Use $jd-to-demo-workflow.

这是我的岗位 JD 和个人背景。请先分析岗位要求，再给我三条项目路线。
不要直接开始写代码，等我确认路线后再生成项目。
```

### 3. 确认路线后生成项目

```text
我确认选择路线 A。
请直接进入实现阶段，生成一个可以本地运行的完整项目，并附带 README、mock 数据、验收标准、简历 bullet 和 HR 话术。
```

## Skill 工作流

`jd-to-demo-workflow` 的默认流程：

1. 提取岗位信息：岗位名称、公司业务、职责、要求、关键词和不确定字段。
2. 拆解能力信号：把 JD 转成招聘方真正想验证的能力。
3. 匹配个人背景：判断用户已有优势、短板、时间预算和可解释范围。
4. 生成三条路线：
   - 最快落地路线
   - 岗位命中路线
   - 技术展示路线
5. 等用户确认路线。
6. 基于确认路线生成项目：
   - 页面和交互
   - API 和数据结构
   - AI 行为和 prompt
   - mock 模式和环境变量
   - README 和运行说明
   - 验收标准
7. 生成求职材料：简历 bullet、BOSS/HR 消息和 90 秒演示脚本。

## 输出质量标准

一个合格的求职 demo 应该满足：

- 30 秒内能看出它和目标岗位相关。
- 有可操作的界面或接口，而不是只有概念说明。
- 项目范围适合用户当前能力和时间预算。
- 技术栈选择有理由，不是为了堆技术。
- 用户能讲清楚项目逻辑、功能边界、技术选择和下一步优化。
- 简历上能写成具体结果，而不是“使用 XX 技术完成项目”。
- 不伪造实习经历，不夸大生产级能力。
- API key 不写进前端代码；真实部署时使用后端、代理或 serverless 环境变量。

## 本地工具

可以直接用浏览器打开：

```text
tools/demo-workflow/index.html
```

它适合辅助整理岗位信息、项目路线和 demo brief。真正复杂的路线判断和项目生成，推荐交给 Codex Skill 完成。

## 相关文档

- `docs/product-prd.md`：产品定位、目标用户、三路线决策和版本规划。
- `docs/workflow.md`：从 JD 到 demo 的完整执行流程。
- `docs/delivery-checklist.md`：判断 demo 是否足够交付给 HR 的检查清单。
- `docs/skill-usage.md`：在 Codex 中调用 skill 的推荐方式。
- `docs/skill-installation.md`：从仓库同步或安装 skill 的详细步骤。
- `docs/validation.md`：验证脚本和质量检查说明。

前向测试样例：

- `examples/skill-forward-test.md`
- `examples/skill-forward-test-expected-output.md`

## 验证

```powershell
.\scripts\validate-workflow.ps1 -SkipInstalledSkillCompare
```

也可以检查 skill 输出结构：

```powershell
.\scripts\check-skill-output.ps1
```

建议在修改 `skills/jd-to-demo-workflow/SKILL.md` 或 `skills/jd-to-demo-workflow/references/` 后运行验证。

## 推荐维护方式

- `README.md` 面向用户，讲清楚“先选路线，再生成项目”的核心价值。
- `skills/jd-to-demo-workflow/SKILL.md` 保持精简，只放 Codex 执行工作流必须知道的内容。
- `skills/jd-to-demo-workflow/references/` 放详细方法、示例、输出格式和 API 约束。
- `examples/` 放真实或脱敏的岗位案例，方便测试输出质量。
- `templates/` 放用户可复制填写的输入和沟通模板。
- `docs/` 放产品定位、工作流、验证和安装说明。

## 版本规划

### v0.1.0

- 完成 JD 到三条项目路线的核心工作流。
- 支持用户确认路线后继续生成完整项目。
- 支持 Codex Skill 调用。
- 提供模板、示例、本地 HTML 工具和验证脚本。

### v0.2.0

- 增加更多岗位类型案例。
- 强化 BOSS 直聘截图解析流程。
- 优化不同技术栈学生的项目降级策略。
- 增强路线对比和用户确认流程。

### v0.3.0

- 增加项目脚手架生成。
- 支持岗位投递记录和复盘。
- 为相似岗位推荐可复用的项目底座。

## 贡献

欢迎提交这些类型的改进：

- 新岗位样例。
- 更好的三路线生成策略。
- 更清晰的路线对比模板。
- 更稳定的 Codex 项目生成提示词。
- 更安全的 API key、mock 模式和部署方式。

提交 PR 前建议先运行验证脚本，并尽量附上输入样例和输出结果。

## 许可证

本项目采用 MIT License。你可以自由使用、修改和分发，但请保留原始许可证声明。
