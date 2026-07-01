# API Patterns

## Static prototype

Use when the demo is an HTML-only or frontend-only prototype.

- Keep all data local or mock.
- Do not put real API keys in browser JavaScript.
- Include a clearly named mock function such as `generateMockAnalysis`.
- Add notes for how a future backend would call the real model.

## Serverless route

Use for Next.js, Vercel, Netlify, or similar deployments.

- `POST /api/analyze`
- Read `OPENAI_API_KEY` or compatible provider key from environment variables.
- Return structured JSON.
- Validate input and return clear errors.
- Include `.env.example`.

## Backend proxy

Use for Express, FastAPI, NestJS, or similar backend demos.

- Frontend calls backend.
- Backend calls LLM provider.
- Keys live only on server.
- Add request schema and response schema.

## OpenAI-compatible model config

Prefer configurable values:

```text
LLM_API_KEY=
LLM_BASE_URL=https://api.openai.com/v1
LLM_MODEL=
```

Use provider-neutral wording unless the user names a provider.

## Suggested response schema

```json
{
  "summary": "",
  "abilitySignals": [],
  "features": [],
  "apiPlan": [],
  "dataEntities": [],
  "codingPrompt": "",
  "resumeBullet": "",
  "hrMessage": ""
}
```

