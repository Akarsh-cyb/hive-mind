# Hive-Mind Skill for Claude Code

Master unified skill consolidating all Claude Rules (15 total) + user skills + Obsidian management.

## Installation Status

✅ **FULLY INSTALLED**

- Skill definition: `hive-mind.md`
- Skill manifest: `hive-mind-manifest.json`
- Skill registry: `skills-registry.json`
- Skill loader: `skill-loader.ps1`
- Bootstrap script: `../ hive-mind-init.ps1`
- Settings integration: `~/.claude/settings.json` (skillOverrides + env)
- Session hook: SessionStart hook (auto-init)

## Quick Start

### Automatic (Default)
```
[New session starts]
→ SessionStart hook fires
→ hive-mind-init.ps1 runs
→ All 15 rules loaded
→ Skills loaded
→ Hive-Mind ACTIVE
```

### Explicit Invocation
```
/hive-mind [your question]
/hive-mind research: adversarial ML attacks
/hive-mind cert: explain data poisoning for SecAI+
/hive-mind I learned about UEBA detection
/hive-mind build: Python log analyzer
```

## How It Works

1. **Context Detection** — Auto-detects if question is about cert/project/research/learning/brain-dump
2. **Rule Loading** — Loads all 15 rules from Claude Rules - Windows.md
3. **Skill Loading** — Loads user profile from My Skills.md
4. **Vault Search** — Searches Obsidian vault first for existing knowledge
5. **Context Routing** — Routes response to appropriate folder:
   - Cert keywords → CompTIA SecAI+/Daily Notes/
   - Project keywords → Ideas/
   - Research keywords → Research/
   - Learning keywords → Cyber Notes/
   - Brain dump keywords → Session Log
6. **Response Generation** — Generates context-aware response
7. **Obsidian Save** — Saves to appropriate folder + session log
8. **Source Citation** — Cites all sources (Rule 3)
9. **Wikilink Creation** — Creates wikilinks (same-domain only, Rule 4)

## Files Required

**Must Exist:**
- `Setup & Config/Claude Rules - Windows.md` (all 15 rules)
- `Skills/My Skills.md` (skills profile)
- `CompTIA SecAI+/Chat Logs/` (session logs)

**Generated:**
- Session logs (appended each turn)
- Topic-specific files (created as needed)

## Skill Features

### Rule Enforcement (15 Rules)
1. Live Obsidian saving
2. TTS (conditional: Windows off, Termux on)
3. Source validation
4. Obsidian graph + linking
5. Ideas match skills
6. Vault-first search
7. Device context awareness
8. User context awareness
9. Auto-update rules
10. GitHub integration
11. Append-only protection
12. Hourly vault sync
13. Mobile SSH control
14. Custom slash commands
15. **Hive-Mind auto-startup**

### Capabilities
- Context-aware routing
- Automatic rule enforcement
- Vault-first knowledge search
- Source validation & citation
- Multi-device support (Windows + Android)
- GitHub backup integration
- Session logging (append-only)
- Wikilink management
- Skill profile tracking

### Integration Points
- **Obsidian:** Live saving, append-only logs, vault search
- **GitHub:** Hourly backup to cloud-plus-obsidian repo
- **Devices:** Windows primary, Samsung S25 Ultra secondary, OneDrive sync
- **Claude Code:** SessionStart hook, skillOverrides, env vars

## Environment Variables

Set in `~/.claude/settings.json`:
```json
"env": {
  "HIVE_MIND_ENABLED": "true",
  "HIVE_MIND_VERSION": "1.0.0",
  "HIVE_MIND_VAULT": "C:\\Users\\akars\\OneDrive\\Desktop\\Akarsh",
  "HIVE_MIND_RULES_FILE": "Setup & Config\\Claude Rules - Windows.md",
  "HIVE_MIND_SKILLS_FILE": "Skills\\My Skills.md"
}
```

## Invocation Methods

### Method 1: Automatic (Default)
- Runs on session start via SessionStart hook
- No user action needed
- Loads all rules + skills automatically

### Method 2: Explicit Command
```bash
/hive-mind [question]
/hive-mind research: [topic]
/hive-mind cert: [topic]
```

### Method 3: Slash Command Aliases
```bash
/hm [same as /hive-mind]
```

## Skill Structure

```
~/.claude/skills/
  ├── hive-mind.md (skill definition)
  ├── hive-mind-manifest.json (metadata + capabilities)
  ├── skills-registry.json (registry of all skills)
  ├── skill-loader.ps1 (invocation handler)
  └── README.md (this file)

~/.claude/
  └── hive-mind-init.ps1 (bootstrap script)

~/.claude/settings.json
  ├── hooks.SessionStart (auto-init hook)
  ├── skillOverrides.hive-mind (enable skill)
  └── env (hive-mind env vars)
```

## Testing

Verify skill is installed:
```bash
# Should show hive-mind in available skills
claude code
[/hive-mind should be available]

# Test skill invocation
/hive-mind What is data poisoning?

# Check session log was created
ls ~/Obsidian/CompTIA\ SecAI+/Chat\ Logs/
[Should show today's session log]
```

## Troubleshooting

| Issue | Solution |
|-------|----------|
| Skill not found | Run `claude reload-skills` or restart Claude Code |
| Rules not loading | Verify `Claude Rules - Windows.md` exists and is readable |
| Skills not loading | Verify `My Skills.md` exists in Skills/ folder |
| Obsidian not updating | Check vault path in env vars matches actual location |
| SessionStart hook not firing | Verify hook is in settings.json and Claude Code restarted |

## Customization

### Add New Rules
1. Add rule to `Claude Rules - Windows.md`
2. Update rule count in hive-mind-manifest.json
3. Update MASTER RULES section in hive-mind.md
4. Session restart loads new rules automatically

### Change Vault Path
Update env var in `~/.claude/settings.json`:
```json
"HIVE_MIND_VAULT": "C:\\your\\new\\path"
```

### Add New Context Type
Add keyword mapping to hive-mind.md routing table and skill-loader.ps1

## Documentation

- **Skill Definition:** `hive-mind.md` (complete skill behavior)
- **Manifest:** `hive-mind-manifest.json` (metadata + config)
- **Installation Guide:** `Setup & Config/HIVE-MIND-INSTALL.md`
- **Compliance Report:** `Setup & Config/HIVE-MIND-COMPLIANCE-REPORT.md`
- **Claude Rules:** `Setup & Config/Claude Rules - Windows.md` (all 15 rules)

## Support

Questions? Check:
1. `hive-mind.md` (what it does)
2. `hive-mind-manifest.json` (how it's configured)
3. `Setup & Config/Claude Rules - Windows.md` (all rules)
4. Session logs (what happened last session)

## Version

- **Version:** 1.0.0
- **Release Date:** 2026-04-20
- **Status:** Production
- **Maintainer:** Akarsh

---

#hive-mind #skill #claude-code #obsidian #automation
