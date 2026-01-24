# DWM Git Workflow (Patching → Testing → Merging)

This document describes a clean, repeatable Git workflow for maintaining a
patched DWM build with long-term stability in mind.

---

## 1. Repository Model

Branches have clear roles:

- **main** – known-good daily driver
- **feature/<patch>** – one patch or experiment
- **upgrade/<version>** – DWM version upgrades

Rule: **`main` must always build and start X successfully.**

---

## 2. Start Clean

Always begin on `main`:

```bash
git checkout main
git pull
git status
```

Expected:
```
nothing to commit, working tree clean
```

If not clean, stop.

---

## 3. Create a Feature Branch (One Patch Only)

```bash
git checkout -b feature/<patch-name>
```

Examples:
- feature/cool-autostart
- feature/shift-tools
- feature/vanitygaps

Never apply patches directly on `main`.

---

## 4. Apply the Patch

Follow PATCHING_CHECKLIST.md:

```bash
patch --dry-run -p1 < patches/<patch>.diff
patch -p1 < patches/<patch>.diff
make clean && make && sudo make install
```

Restart DWM and test thoroughly.

---

## 5. Commit the Patch

```bash
git add .
git commit -m "Add <patch-name> patch"
```

Rules:
- One patch per commit
- Clear, imperative commit messages

---

## 6. Evaluate the Patch

Ask:
- Does it behave as expected?
- Any regressions or surprises?
- Does it overlap existing patches?

### If you do NOT want it

```bash
git checkout main
git branch -D feature/<patch-name>
```

No cleanup required.

---

## 7. Merge into main

When satisfied:

```bash
git checkout main
git merge --no-ff feature/<patch-name>
```

Why `--no-ff`:
- Preserves history
- Makes later removal easier
- Documents intent

Optional:
```bash
git branch -d feature/<patch-name>
```

---

## 8. Post-Merge Verification

On `main`:

```bash
make clean
make
sudo make install
```

Smoke test:
- Spawn windows
- Switch tags
- Toggle floating
- Restart DWM

Only proceed when stable.

---

## 9. Removing a Patch

### Recent patch
```bash
git reset --hard <commit-before-patch>
```

### Older isolated patch
```bash
git revert <commit-hash>
```

---

## 10. Handling Conflicts

If something goes wrong:

```bash
git status
git diff
```

Options:
- Fix manually and commit
- Or abort safely:

```bash
git reset --hard
```

Never leave half-applied patches.

---

## 11. Upgrading DWM Versions

```bash
git checkout -b upgrade/dwm-<version>
git remote add upstream https://git.suckless.org/dwm
git fetch upstream
git rebase upstream/master
```

Resolve conflicts carefully.

When stable:
```bash
git checkout main
git merge upgrade/dwm-<version>
```

---

## 12. Golden Rules

- One patch = one branch
- One patch = one commit
- Never patch on main
- Delete branches freely
- Reset hard when unsure
- Stability beats cleverness

---

## 13. Recommended Repo Files

```text
PATCHING_CHECKLIST.md
PATCHES_APPLIED.md
GIT_WORKFLOW.md
README.md
```

These turn your DWM setup into a maintainable system.
