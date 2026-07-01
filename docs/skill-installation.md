# Skill Installation and Sync

这个项目的核心能力优先沉淀为 Codex skill。

仓库内源码：

```text
skills/jd-to-demo-workflow
```

本机已安装位置：

```text
C:\Users\Administrator\.codex\skills\jd-to-demo-workflow
```

## 安装到 Codex

如果换电脑或重新安装，可以把仓库里的 skill 复制到 Codex skills 目录：

```powershell
New-Item -ItemType Directory -Force "$env:USERPROFILE\.codex\skills" | Out-Null
Copy-Item -Path ".\skills\jd-to-demo-workflow" -Destination "$env:USERPROFILE\.codex\skills\jd-to-demo-workflow" -Recurse -Force
```

安装后，在新线程里可以这样调用：

```text
Use $jd-to-demo-workflow to analyze this internship job screenshot and my background.
First propose three project routes with different tradeoffs. Wait for my confirmation before generating the selected project.
```

## 从本机安装版同步回仓库

如果你直接修改了本机安装版 skill，可以同步回仓库：

```powershell
Copy-Item -Path "$env:USERPROFILE\.codex\skills\jd-to-demo-workflow" -Destination ".\skills\jd-to-demo-workflow" -Recurse -Force
```

## 校验

使用系统 skill-creator 的校验脚本：

```powershell
python "$env:USERPROFILE\.codex\skills\.system\skill-creator\scripts\quick_validate.py" ".\skills\jd-to-demo-workflow"
```

校验成功应该输出：

```text
Skill is valid!
```
