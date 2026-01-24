# DWM Patch Checklist (Reusable)

## 0. Preconditions (Before Touching Anything)

- [ ] You are **in the dwm source root**
- [ ] Working tree is clean (`git status`)
- [ ] You are on the intended branch
- [ ] Vanilla DWM builds and runs

---

## 1. Patch Intake

- [ ] Patch file placed in `patches/`
- [ ] Patch filename preserved exactly
- [ ] Patch source URL noted (optional)

---

## 2. Dry Run (Mandatory)

- [ ] Run dry run  
  `patch --dry-run -p1 < patches/<patchname>.diff`
- [ ] No failed hunks
- [ ] Stop immediately if failures occur

---

## 3. Apply Patch

- [ ] Apply patch  
  `patch -p1 < patches/<patchname>.diff`
- [ ] Review output for warnings

---

## 4. Immediate Sanity Check

- [ ] Review changes (`git diff`)
- [ ] Changes match patch intent
- [ ] No unexpected deletions

---

## 5. Build & Install

- [ ] `make clean`
- [ ] `make`
- [ ] `sudo make install`

---

## 6. Runtime Verification

- [ ] Restart DWM (Mod+Shift+Q or restart X)
- [ ] Test affected behavior
- [ ] Reset hard if broken

---

## 7. Commit (No Exceptions)

- [ ] `git add .`
- [ ] `git commit -m "Add <patch-name>"`

---

## 8. Document Patch

Update `PATCHES_APPLIED.md` with:
- Patch name
- Notes (conflicts, behavior changes)

---

## 9. Push (Optional)

- [ ] `git push origin main`

---

## Removal Checklist

- Identify commit
- `git reset --hard <commit>`
- Rebuild and test

---

## Emergency Recovery

- Switch to TTY
- Reset to last good commit
- Rebuild and reinstall

---

## Long-Term Maintenance

- Backup repo
- Create test branch
- Rebase carefully
- Merge only when stable

---

## Core Rules

- One patch = one commit
- Never patch a dirty tree
- Test immediately
- Drop patches aggressively
- Stability beats cleverness
