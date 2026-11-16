# AgentCV skill

A skill that helps your agent describe the agent team you already run. It follows the open [Agent Skills](https://agentskills.io/specification) format. It is built around Claude Code's `.claude/agents` files, and OpenClaw and Hermes Agent can load it too.

- **Describe your team.** Your agent reads only the frontmatter of your `.claude/agents/*.md` files and asks you for everything else. It writes a local `TEAM.md` with an org chart (Mermaid) and a table of each agent's role, model and platform. The file is useful on its own, and the skill sends nothing to AgentCV or any other service unless you say yes. If you want, it then drafts an [AgentCV](https://agentcv.ai) profile, shows it to you, and checks it with AgentCV **only after you say yes**. You sign in, review every field and press Submit yourself.
- **Start from a team.** Give it an `https://agentcv.ai/teams/<slug>` link. It fetches that team's public structure (role titles, topology, platform) and writes **inert starter drafts** (`agentcv-starter/agentcv-<n>-starter.md`), which you rename, fill in and move yourself. This works for unclaimed curated teams and demo teams.

What it never does:
- read `.env` files, credentials, keys, tokens, cookies, harness config files, `CLAUDE.md` or `AGENTS.md`;
- copy a prompt body or overwrite a file;
- send your data anywhere without asking first. Start-from mode fetches only the one public AgentCV page you link.

The full rules are in [`skills/agentcv/SKILL.md`](skills/agentcv/SKILL.md). More at <https://agentcv.ai/skill>.

## Install

**With the `skills` CLI** (Claude Code and other agents):

```sh
npx skills add intronode/agentcv-skills
```

**As a Claude Code plugin:**

```text
/plugin marketplace add intronode/agentcv-skills
/plugin install agentcv@agentcv
```

**Hermes Agent:**

```sh
hermes skills install intronode/agentcv-skills/skills/agentcv
```

**Manually** (Claude Code shown; for OpenClaw use `~/.openclaw/skills`):

```sh
mkdir -p ~/.claude/skills/agentcv && curl -fsSL https://agentcv.ai/skills/agentcv/SKILL.md -o ~/.claude/skills/agentcv/SKILL.md
```

If your agent doesn't see the skill, start a new session.

## Use

Ask your agent, for example:
- "Document my agent team" or "Put my team on AgentCV"
- "Start from https://agentcv.ai/teams/<slug>"

## About

AgentCV (<https://agentcv.ai>) is a public registry of AI agent teams. Each profile is labelled real (registered by its owner), curated (documented from public sources) or illustrative (a demo). `skills/agentcv/SKILL.md` is byte-identical to the file served at <https://agentcv.ai/skills/agentcv/SKILL.md>; `scripts/check-sync.sh` checks that.

License: [MIT-0](LICENSE).
