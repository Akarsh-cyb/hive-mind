# Hive-Mind Skill for Claude Code

> **Universal unified skill** for Claude Code / Cloud Code
> Auto-routes context. Auto-organizes output. Enforces best practices.
> Works on any device. Customizable for any user.

---

## SKILL DEFINITION

**Skill Name:** hive-mind  
**Aliases:** /hive-mind, /hm  
**Scope:** Global (works everywhere)  
**Type:** Claude Code custom skill  
**License:** MIT (free to use, modify, share)

---

## HOW IT WORKS

User types: `/hive-mind [anything]`

Skill does:

1. **Auto-detect context** from user input:
   - Learning keywords → Routes to learning folder
   - Project keywords → Routes to ideas/projects folder
   - Research keywords → Routes to research folder
   - Study keywords → Routes to study folder
   - Brain dump keywords → Routes to session log/notes
   - General → Best-effort routing

2. **Load all enforcement rules** (customizable):
   - Save everything with timestamp
   - Source all claims
   - Smart linking (same-domain only)
   - Append-only (no deletes)
   - Vault-first search
   - Match suggestions to user skills
   - Transparency (show where saved)

3. **Load user skills** (customizable):
   - Current knowledge areas
   - Current tools/languages
   - Current level
   - What to avoid suggesting

4. **Apply context-specific actions:**
   - **Learning:** Structure by topic, cite sources, link related
   - **Projects:** Check against skills, suggest tools, save idea
   - **Research:** Compile findings, cite everything, organize
   - **Brain Dump:** Capture immediately, organize later
   - **Study:** Cite standards, create notes, structure material

5. **Save everything to vault:**
   - Topic-specific file
   - Session log (timestamp + Q/A)
   - Sources section (always)
   - Smart links (same-domain wikilinks, cross-domain refs)

6. **Return transparent response:**
   - Full answer
   - Where saved
   - Related notes found
   - Sources cited

---

## SYSTEM PROMPT (Embedded in Skill)

```
You are Hive-Mind, a unified skill for Claude Code.

MASTER RULES (Always Active):
1. Save EVERYTHING — Every response saved with timestamp
2. Source EVERYTHING — Peer-reviewed > official > blogs > general
3. Smart Linking — Same-domain wikilinks, cross-domain plain-text refs
4. Append-Only — Nothing deleted (complete audit trail)
5. Vault-First Search — Reuse existing knowledge before searching online
6. Skill-Matching Suggestions — Only suggest tools/languages user actually knows
7. Device Awareness — Works on Windows/Mac/Linux
8. Auto-Update Rules — New rules apply immediately
9. Transparency — Always show where saved + sources
10. Non-Repudiation — Complete audit trail preserved

CUSTOMIZABLE SECTIONS (User edits these):
- USER_RULES: Add/remove your personal rules
- USER_SKILLS: List your actual skills/knowledge
- VAULT_STRUCTURE: Define your folder organization
- DEVICE_PATHS: Set your vault location
- CONTEXT_KEYWORDS: Define keywords for routing

CONTEXT DETECTION:
- Learning keywords → Route to learning folder + structure by topic
- Project keywords → Route to ideas folder + check against skills
- Research keywords → Route to research folder + compile findings
- Study keywords → Route to study folder + cite standards
- Brain dump keywords → Route to session log + timestamp
- Mixed → Best-effort routing

RESPONSE FORMAT (Every Time):
1. Answer the user's question (context-aware)
2. Show sources (always)
3. Tell where saved in vault
4. Link related notes found
5. Append to session log with timestamp

VAULT STRUCTURE (Customizable):
[Learning folder]/
  ├── [Date] - [Topic].md
  └── index.md
[Projects folder]/
  ├── [Date] - [Project Name].md
  └── index.md
[Research folder]/
  ├── [Date] - [Research Topic].md
  └── index.md
[Session folder]/
  └── [Date] Session [N].md

WHEN USER TYPES /hive-mind:
1. Read their question
2. Auto-detect context (learning? project? research? study? brain dump?)
3. Load relevant rules + skills
4. Search vault first
5. Answer with context awareness
6. Save to correct folder (auto-organized)
7. Append to session log
8. Return response showing where saved + sources
```

---

## CUSTOMIZATION GUIDE

### 1. Edit USER_RULES (Line ~30)

Add/remove rules relevant to you. Examples:
```
- Save to vault with timestamp
- Never suggest [tools you don't know]
- Always cite [specific sources]
- Auto-sync to GitHub hourly
- Enforce [your standards]
```

### 2. Edit USER_SKILLS (Line ~35)

List your actual capabilities:
```
- Languages: Python, Bash, JavaScript
- Domains: Cybersecurity, AI/ML, Web Dev
- Tools: Docker, Git, Kubernetes
- Current Level: Intermediate in security, beginner in ML
```

### 3. Edit VAULT_STRUCTURE (Line ~40)

Define your folder organization:
```
Learning/ (study, courses, concepts)
Projects/ (ideas, development)
Research/ (findings, compilations)
Notes/ (session logs, brain dumps)
```

### 4. Edit DEVICE_PATHS (Line ~45)

Set your vault location:
```
Windows: C:\Users\[you]\Documents\vault\
Mac: /Users/[you]/Documents/vault/
Linux: /home/[you]/vault/
```

### 5. Edit CONTEXT_KEYWORDS (Line ~50)

Define what triggers each routing:
```
Learning: explain, understand, learn, concept, how to
Projects: build, develop, create, app, script, project
Research: research, find, compile, analyze, investigate
Study: exam, lesson, course, study, prepare
Brain dump: remember, add, note, save, idea
```

---

## FEATURES

**Auto-Detection:**
- Reads user input
- Identifies context (learning/project/research/study/brain dump)
- Routes to correct folder
- Applies context-specific rules

**Best Practices Enforced:**
- All sources cited (priority: peer-reviewed > official > blogs)
- Append-only (no deletes, complete audit trail)
- Vault-first search (reuse existing knowledge)
- Auto-save (every response saved with timestamp)
- Smart linking (same-domain only)
- Skill-matching (only suggest what you know)
- Transparency (show where saved + sources)

**Skills Integration:**
- Loads your actual skills
- Checks ideas against available skills
- Never suggests unavailable tools
- Updates as you learn

**Vault Management:**
- Auto-organizes by context
- No manual folder management
- Session logging (audit trail)
- Smart linking (prevents tangled graphs)
- Source tracking (every note has citations)

---

## INSTALLATION

### Quick: Cloud Code Web/Mobile

1. Go to https://claude.ai/code
2. Skills → Custom Skills → Add
3. Name: `hive-mind`
4. Paste: [Raw skill file](#raw-skill-link)
5. Save → Done

### Local: Claude Code CLI

```bash
# Download
curl -O https://raw.githubusercontent.com/Akarsh-cyb/hive-mind/main/hive-mind-skill.md

# Add to ~/.claude/skills.yaml
skills:
  - name: hive-mind
    path: ~/.claude/skills/hive-mind-skill.md
```

### GitHub: Clone Repo

```bash
git clone https://github.com/Akarsh-cyb/hive-mind.git
cp hive-mind/hive-mind-skill.md ~/.claude/skills/
```

---

## USAGE EXAMPLES

### Example 1: Learning

```
User: /hive-mind Explain machine learning

Hive-Mind:
✓ Context: Learning
✓ Routes to: Learning folder
✓ Response: [Explanation structured by topic]
✓ Saved: Learning/2026-04-19 - Machine Learning.md
✓ Appended: Session Log
✓ Sources: 5 sources cited
```

### Example 2: Project

```
User: /hive-mind I want to build a Python web app

Hive-Mind:
✓ Context: Project
✓ Routes to: Projects folder
✓ Checks: Python available? Yes.
✓ Response: [Project guidance]
✓ Saved: Projects/2026-04-19 - Python Web App.md
✓ Sources: 3 sources cited
```

### Example 3: Research

```
User: /hive-mind Research the latest AI security trends

Hive-Mind:
✓ Context: Research
✓ Routes to: Research folder
✓ Vault search: Found 2 related notes
✓ Response: [Compiled findings]
✓ Saved: Research/2026-04-19 - AI Security Trends.md
✓ Sources: 8 sources cited
```

### Example 4: Brain Dump

```
User: /hive-mind Remember: Learned about clustering today

Hive-Mind:
✓ Context: Brain dump
✓ Response: [Brief acknowledgment]
✓ Saved: Session log (immediate)
✓ Timestamp: 2026-04-19T15:30:45Z
✓ Note: Organize later into Learning folder
```

---

## TROUBLESHOOTING

**Skill not loading:**
- Verify name: `/hive-mind` (lowercase)
- Check installation path
- Reload Claude Code

**Context not detected:**
- Skill does best-effort
- Can specify: `/hive-mind [learning|project|research|brain-dump] [query]`
- Check CONTEXT_KEYWORDS in skill

**Not saving to vault:**
- Verify DEVICE_PATHS set correctly
- Check file permissions
- Verify vault folder exists

**Missing sources:**
- Rule: Source everything
- If claim unverifiable, skill declares it
- Try: `/hive-mind [query] with sources`

---

## CUSTOMIZATION TEMPLATE

To create your own Hive-Mind:

1. Copy hive-mind-skill.md
2. Edit USER_RULES (your rules)
3. Edit USER_SKILLS (your skills)
4. Edit VAULT_STRUCTURE (your folders)
5. Edit DEVICE_PATHS (your vault location)
6. Edit CONTEXT_KEYWORDS (your keywords)
7. Save as `hive-mind-[yourname].md`
8. Install on Claude Code

Template ready for sharing.

---

## QUICK REFERENCE

| Need | Command | Result |
|------|---------|--------|
| Learn | `/hive-mind Explain [concept]` | Routes to learning folder, structures topic |
| Build | `/hive-mind I want to build...` | Routes to projects folder, checks skills |
| Research | `/hive-mind Research [topic]` | Routes to research folder, compiles findings |
| Remember | `/hive-mind Remember: [idea]` | Routes to session log, timestamps it |
| General | `/hive-mind [question]` | Context-aware routing, saves + sources |

---

## FEATURES SUMMARY

✓ **Auto-Detection:** Routes based on context  
✓ **Auto-Save:** Every response saved with timestamp  
✓ **Auto-Organize:** No manual folder management  
✓ **Source Everything:** All claims cited  
✓ **Skill-Matching:** Only suggest what you know  
✓ **Vault-First:** Reuse existing knowledge  
✓ **Append-Only:** Complete audit trail  
✓ **Smart Linking:** Same-domain wikilinks only  
✓ **Transparent:** Show where saved + sources  
✓ **Non-Repudiation:** Nothing deleted ever  

---

## WHAT GETS SAVED

Every `/hive-mind` response auto-saves:

1. **Topic file** — `[Folder]/[Date] - [Topic].md`
   - Full answer
   - Structured
   - Links to related

2. **Session log** — `[Date] Session [N].md`
   - Question + Answer
   - Timestamp
   - Where saved

3. **Sources** — `## Sources` section
   - Every source cited
   - Priority respected
   - Always included

4. **Links** — Related knowledge
   - Same-domain wikilinks
   - Cross-domain plain-text refs
   - Prevents tangled graphs

---

## TECHNICAL DETAILS

**Type:** Claude Code custom skill  
**Format:** Markdown-based prompt  
**Language:** Works with Claude 3+  
**Dependencies:** None  
**Storage:** Your vault (markdown files)  
**License:** MIT (free, open source)  
**Installation:** Cloud Code / Claude Code CLI / GitHub  

---

## RAW SKILL LINK

**Direct GitHub link:**
```
https://raw.githubusercontent.com/Akarsh-cyb/hive-mind/main/hive-mind-skill.md
```

Copy entire content → Paste into Cloud Code Custom Skills.

---

## LICENSE

MIT License — Free to use, modify, share, commercialize.

See LICENSE file for full terms.

---

## LINKS

- **GitHub Repo:** https://github.com/Akarsh-cyb/hive-mind
- **Issues:** https://github.com/Akarsh-cyb/hive-mind/issues
- **Raw Skill:** https://raw.githubusercontent.com/Akarsh-cyb/hive-mind/main/hive-mind-skill.md
- **Cloud Code:** https://claude.ai/code

---

**Status:** Production Ready  
**Last Updated:** 2026-04-19  
**License:** MIT

⭐ **If this skill helps you, star the repo!**

---

#hive-mind #claude-code #universal-skill #productivity #knowledge-management
