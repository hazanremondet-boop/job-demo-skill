# Screenshot Job Analysis

Use this reference when the job source is a screenshot, photo, OCR text, or partial visual capture from BOSS Zhipin, job boards, chats, or recruiter messages.

## Extract visible facts

Separate visible facts from inference.

- Company:
- Role title:
- Direction: AI application, full-stack, frontend, backend, algorithm, product/ops, unknown
- Location:
- Internship type:
- Salary/range if visible:
- Education/year constraints:
- Responsibilities:
- Requirements:
- Tech keywords:
- Business keywords:
- Benefits/constraints:
- Recruiter notes:

## Mark uncertainty

If the screenshot is cropped, blurry, or missing text, write:

```text
Uncertain / missing:
- [field]: reason
```

Do not invent company facts. Infer only from visible text and label the inference.

## Convert to ability signals

For each requirement, produce:

- requirement
- ability signal
- demo proof
- priority: high / medium / low

Example:

```text
Requirement: 熟悉 React + Node.js
Ability signal: Can build a full-stack product flow
Demo proof: React dashboard + API routes + persisted analysis history
Priority: high
```

## Decide whether to ask follow-up questions

Ask at most 2 questions only when missing information changes the project direction. Otherwise continue with assumptions.

Good questions:

- 你希望这个项目更偏 AI 应用，还是更偏全栈业务系统？
- 你可投入时间是 24/48/72 小时里的哪一种？

Avoid asking for information that can be assumed safely, such as exact school name, unless the user wants resume copy.

