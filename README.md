# JD to Demo Workflow

把招聘 JD、BOSS 直聘截图或岗位要求，转成一个可在 1-3 天内完成、能写进简历、能发给 HR、能让 Codex 直接开工的求职 demo 项目方案。

这个仓库的核心不是“再做一个练手项目”，而是帮学生和早期求职者把岗位要求拆成能力信号，再用一个小而完整的作品证明：我已经能解决这个岗位真实关心的问题。

## 适合谁使用

- 大二、大三、研一、转专业或早期求职者，缺少强相关实习经历。
- 想投 AI 应用、全栈、前端、后端、数据、运营工具、教育科技、招聘科技等岗位。
- 简历项目比较泛，和目标岗位没有直接对应关系。
- 需要快速生成一个可演示、可部署、可解释、可写进简历的项目。
- 想让 Codex 根据 JD 自动生成项目提示词，并继续完成代码实现。

## 这个项目能做什么

输入一段 JD、岗位截图、个人背景和时间预算后，工作流会生成：

- 岗位信息提取：岗位名称、公司业务、职责、技术关键词、不确定信息。
- 招聘需求理解：硬技能、隐性能力信号、优先级、最佳证明材料。
- 个人 fit/gap 分析：已有优势、需要补的短板、哪些能力适合用 demo 证明。
- Demo 项目策略：项目方向、MVP 范围、非目标、技术选型、交付物。
- Codex-ready 项目提示词：可以直接复制到新 Codex 线程里开工。
- 求职材料：简历 bullet、BOSS/HR 开场消息、90 秒演示脚本。

## 典型使用场景

```text
我是一名大三学生，会 React、Node.js 和一点 Python。
这是一个 AI 应用开发实习 JD。
请帮我分析岗位要求，并生成一个 2 天内能完成的 demo 项目提示词。
```

或：

```text
Use $jd-to-demo-workflow to analyze this BOSS Zhipin job screenshot and my background,
then generate a Codex-ready internship demo project prompt.
```

## 仓库结构

```text
.
|-- README.md
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

### 1. 阅读方法论

先看这几个文档：

- `docs/product-prd.md`：产品定位、目标用户和 MVP 范围。
- `docs/workflow.md`：从 JD 到 demo 的完整执行流程。
- `docs/delivery-checklist.md`：判断 demo 是否足够交付给 HR 的检查清单。
- `docs/skill-usage.md`：在 Codex 中调用 skill 的推荐方式。
- `docs/skill-installation.md`：从仓库同步或安装 skill 的详细步骤。
- `docs/validation.md`：验证脚本和质量检查说明。

### 2. 打开本地小工具

直接用浏览器打开：

```text
tools/demo-workflow/index.html
```

然后填写：

- 岗位 JD 或截图文字。
- 公司业务背景。
- 目标岗位方向。
- 个人技术栈和已有项目。
- 可投入时间。
- 希望包装成 AI 应用、全栈项目、招聘工具、客服质检、教育助教、运营洞察等哪类 demo。

### 3. 使用模板沉淀输入和输出

- `templates/job-intake.md`：整理岗位信息。
- `templates/demo-brief.md`：整理 demo 方案。
- `templates/hr-message.md`：生成发给 HR 或招聘方的话术。

## 安装为 Codex Skill

这个仓库内置了一个 Codex Skill：

```text
skills/jd-to-demo-workflow
```

如果要让 Codex 自动发现它，可以把 skill 文件夹复制到本机 Codex skills 目录。

Windows 示例：

```powershell
Copy-Item -Recurse -Force `
  ".\skills\jd-to-demo-workflow" `
  "$env:USERPROFILE\.codex\skills\jd-to-demo-workflow"
```

macOS / Linux 示例：

```bash
mkdir -p ~/.codex/skills
cp -R ./skills/jd-to-demo-workflow ~/.codex/skills/jd-to-demo-workflow
```

安装后，在 Codex 中可以这样调用：

```text
Use $jd-to-demo-workflow to analyze this JD and my background,
then produce a Codex-ready project prompt, resume bullet, HR message, and demo script.
```

中文也可以：

```text
使用 $jd-to-demo-workflow 分析这个 BOSS 直聘岗位和我的个人背景，
帮我生成一个 2 天内能做完的 AI 应用 demo 项目提示词、简历 bullet 和 HR 开场话术。
```

## Skill 工作流

`jd-to-demo-workflow` 会按下面的顺序工作：

1. 提取岗位信息：岗位名称、公司业务、职责、要求、关键词和不确定字段。
2. 拆解招聘需求：把 JD 转成能力信号、证明材料和优先级。
3. 匹配个人背景：判断已有优势、短板、时间约束和可解释范围。
4. 选择 demo 策略：推荐招聘、客服、教育、运营、全栈看板或自定义业务方向。
5. 压缩 MVP：控制在 1-3 天可完成，避免做成大而空的平台。
6. 生成 Codex 项目提示词：包含页面、接口、数据结构、AI 行为、mock 模式、环境变量、验收标准。
7. 生成求职材料：简历 bullet、BOSS/HR 消息和演示脚本。

## 输出质量标准

一个合格的求职 demo 应该满足：

- 30 秒内能看出它和目标岗位相关。
- 有可操作的界面或接口，而不是只有概念说明。
- 能讲清楚技术选择、功能边界、遇到的问题和下一步优化。
- 简历上能写成具体结果，而不是“使用 XX 技术完成项目”。
- 不伪造实习经历，不夸大生产级能力。
- API key 不写进前端代码；真实部署时使用后端、代理或 serverless 环境变量。

## 验证

仓库提供了 PowerShell 验证脚本：

```powershell
.\scripts\validate-workflow.ps1
```

也可以检查 skill 输出结构：

```powershell
.\scripts\check-skill-output.ps1
```

建议在修改 `skills/jd-to-demo-workflow/SKILL.md` 或 `skills/jd-to-demo-workflow/references/` 后运行验证。

前向测试样例见：

- `examples/skill-forward-test.md`
- `examples/skill-forward-test-expected-output.md`

## 发布到 GitHub

如果这是一个新仓库，可以按下面步骤上线到 GitHub。

### 1. 初始化提交

```bash
git status
git add .
git commit -m "Initial release of JD to demo workflow skill"
```

### 2. 在 GitHub 创建仓库

推荐仓库名：

```text
jd-to-demo-workflow
```

建议描述：

```text
A Codex skill and workflow that turns job descriptions into buildable internship demo projects.
```

可以选择公开仓库，让其他学生和求职者直接参考。

### 3. 绑定远端并推送

把下面的 `<your-github-name>` 替换成你的 GitHub 用户名或组织名：

```bash
git remote add origin https://github.com/<your-github-name>/jd-to-demo-workflow.git
git branch -M main
git push -u origin main
```

推送完成后，GitHub 首页会自动展示这个 README。

### 4. 建议开启的 GitHub 设置

- About 描述：填写仓库简介和关键词。
- Topics：建议添加 `codex-skill`、`career`、`internship`、`job-search`、`ai-demo`、`portfolio`。
- Releases：首次发布可以打 `v0.1.0`。
- Issues：开启后方便收集岗位样例、skill 输出问题和改进建议。

## 推荐维护方式

像维护一个公开 skill 项目一样维护这个仓库：

- `README.md` 面向用户，讲清楚用途、安装、示例和发布方式。
- `skills/jd-to-demo-workflow/SKILL.md` 保持精简，只放 Codex 执行工作流必须知道的内容。
- `skills/jd-to-demo-workflow/references/` 放详细方法、示例、输出格式和 API 约束。
- `examples/` 放真实或脱敏的岗位案例，方便测试输出质量。
- `templates/` 放用户可复制填写的输入和沟通模板。
- `docs/` 放产品定位、工作流、验证和安装说明。

## 版本规划

### v0.1.0

- 完成 JD 到 demo 的核心工作流。
- 支持 Codex Skill 调用。
- 支持本地 HTML 小工具辅助生成方案。
- 提供模板、示例和验证脚本。

### v0.2.0

- 增加更多岗位类型案例。
- 强化 BOSS 直聘截图解析流程。
- 优化不同技术栈学生的项目降级策略。
- 补充英文求职材料输出。

### v0.3.0

- 将 demo brief 管理产品化。
- 增加项目脚手架生成。
- 支持岗位投递记录和复盘。

## 贡献

欢迎提交这些类型的改进：

- 新岗位样例。
- 更好的 demo 项目策略。
- 更清晰的 HR/BOSS 话术模板。
- 更稳定的 Codex 项目提示词。
- 对 API key、mock 模式、部署方式的安全改进。

提交 PR 前建议先运行验证脚本，并尽量附上输入样例和输出结果。

## 许可证

当前仓库还没有声明许可证。公开发布前建议选择一个许可证，例如 MIT License，方便别人复用和贡献。
