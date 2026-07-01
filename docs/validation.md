# Validation

这个项目的核心质量门禁是：

- 仓库版 skill 能通过官方校验。
- 本机安装版 skill 能通过官方校验。
- 仓库版 skill 与本机安装版 skill 内容一致。
- 网页工具的内嵌 JavaScript 能被解析。
- 前向测试样例和合格输出样例存在，并包含关键内容。

## 一键验证

在仓库根目录运行：

```powershell
.\scripts\validate-workflow.ps1
```

成功时会看到：

```text
[ok] workflow validation passed
```

在 Windows 上，skill 对比步骤可能会输出 `LF will be replaced by CRLF` 之类的换行提示。只要脚本最后输出 `[ok] workflow validation passed`，就说明没有实际内容差异。

## 跳过本机安装版对比

如果你在别的机器上还没有安装 skill，可以先只验证仓库内容：

```powershell
.\scripts\validate-workflow.ps1 -SkipInstalledSkillCompare
```

## 什么时候运行

建议在这些时候运行：

- 修改 `skills/jd-to-demo-workflow` 后。
- 修改 `examples/skill-forward-test*.md` 后。
- 修改 `tools/demo-workflow/index.html` 后。
- 准备把仓库发给别人或提交前。

## 检查某次 skill 输出

如果你实际调用 `$jd-to-demo-workflow`，可以把回答保存成 Markdown 文件，然后检查结构是否完整：

```powershell
.\scripts\check-skill-output.ps1 -Path ".\path\to\skill-output.md"
```

也可以用仓库里的黄金输出样例测试脚本：

```powershell
.\scripts\check-skill-output.ps1 -Path ".\examples\skill-forward-test-expected-output.md"
```

成功时会看到：

```text
[ok] skill output looks structurally complete
```

这个脚本只检查结构完整性，例如是否包含 Codex prompt、API、mock、README、HR 消息等关键标记；它不能替代人工判断项目策略是否足够贴合岗位。
