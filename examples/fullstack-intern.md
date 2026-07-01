# Example: 全栈工程师实习生

## 原始岗位

```text
岗位：全栈工程师实习生

岗位职责：
1. 参与内部业务系统和数据看板开发。
2. 负责前端页面、后端接口、数据库表设计和接口联调。
3. 根据业务需求快速完成可用功能。
4. 参与系统优化和部署。

任职要求：
1. 熟悉 React/Vue，了解 TypeScript。
2. 熟悉 Node.js/Python/Java 任一后端技术。
3. 了解数据库设计和 SQL。
4. 有完整项目、后台管理系统或数据看板经验优先。
```

## 能力信号

- 全栈闭环：页面、接口、数据库、部署。
- 业务系统开发：表格、筛选、状态流转、权限或导出。
- 数据建模：能抽象实体和关系。
- 工程交付：能按需求完成稳定可用功能。

## 推荐 demo

项目名：AI 招聘项目管理看板

定位：

> 面向学生求职的项目管理看板，帮助用户管理目标岗位、生成对应 demo brief、跟踪开发进度和投递反馈。

## MVP 功能

1. 岗位管理：新增、编辑、删除目标岗位。
2. Demo brief：为每个岗位记录项目定位、功能、技术栈和计划。
3. 进度看板：待分析、开发中、已完成、已投递。
4. 投递反馈：记录 HR 回复、面试邀约和复盘笔记。
5. 数据看板：统计投递数量、回复率、demo 类型分布。

## 技术方案

- Frontend: React + TypeScript。
- Backend: Node.js + Express 或 Next.js API Routes。
- Database: SQLite/PostgreSQL。
- UI: Ant Design 或 shadcn/ui。
- Deploy: Vercel/Render。

## 数据结构

```text
Job
- id
- company
- role
- jd
- status
- createdAt

DemoBrief
- id
- jobId
- title
- positioning
- features
- techStack
- buildPlan

Application
- id
- jobId
- channel
- message
- feedback
- nextAction
```

## 简历 bullet

独立开发面向实习求职场景的 AI 招聘项目管理看板，支持岗位管理、demo brief 记录、开发进度追踪、投递反馈复盘与数据统计；使用 React + TypeScript + Node.js + SQLite 完成前端页面、后端接口、数据库设计和部署闭环，体现全栈业务系统开发能力。

## HR 话术

您好，我是大二学生，正在找全栈工程师实习。我看到岗位强调前端页面、后端接口、数据库和业务系统开发，所以做了一个求职项目管理看板 demo，包含岗位管理、项目 brief、进度看板和投递反馈统计。想用这个完整小项目展示我的全栈闭环能力，方便的话希望争取一次沟通机会。

