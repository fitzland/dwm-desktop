Using **Rebase** instead of a standard Merge is the "Gold Standard" for DWM patching. It keeps your Git history a straight line and forces you to resolve conflicts **one patch at a time** on the feature branch, rather than having a massive "merge mess" on your master branch.

Here is the step-by-step workflow for the transition from **pertag** to **fullgaps**.

---

### Step 0: The Starting Point
You have two branches based on a vanilla `master`:
*   `master`: Vanilla DWM code.
*   `feat/pertag`: Vanilla + Pertag patch.
*   `feat/fullgaps`: Vanilla + Fullgaps patch.

### Step 1: Merge the first patch into Master
Since `master` is vanilla and `feat/pertag` started from vanilla, this is a "Fast-Forward" merge. No conflicts possible.

```bash
git checkout master
git merge feat/pertag
```
**Result:** `master` now contains Pertag.

---

### Step 2: The Rebase (The "Magic" Part)
Now, your `feat/fullgaps` branch is "out of date." It thinks it's being applied to vanilla DWM, but your `master` now has Pertag code in it. If you just merged, you'd have to fix conflicts in a messy merge commit. Instead, we **rebase**.

```bash
git checkout feat/fullgaps
git rebase master
```

**What Git is doing internally:**
1.  It goes back to the moment you branched `feat/fullgaps` from vanilla.
2.  It "lifts" your Fullgaps commit(s) and sets them aside temporarily.
3.  It updates your `feat/fullgaps` branch to look exactly like the current `master` (which has Pertag).
4.  It tries to "replay" your Fullgaps commit on top of the new Pertag code.

---

### Step 3: Handling the Rebase Conflict
During Step 2, Git will likely stop and say:
> *CONFLICT (content): Merge conflict in dwm.c. Error: could not apply <fullgaps-commit>...*

**This is exactly what you want.** Git is asking you: *"I see Pertag changed the layout logic, and now Fullgaps wants to change it too. How should the code look with both?"*

**How to fix it:**
1.  Open `dwm.c`.
2.  Search for the `<<<<<< HEAD` markers.
3.  **The Logic Fix:** This is where you earn your "Suckless" stripes. 
    *   `fullgaps` will try to use the variable `mfact`.
    *   `pertag` changed `mfact` to something like `selmon->pertag->mfacts[selmon->pertag->curtag]`.
    *   You must manually edit the `fullgaps` code to use the new `pertag` variables.
4.  Save the file.
5.  Tell git you've fixed it: 
    ```bash
    git add dwm.c
    git rebase --continue
    ```

---

### Step 4: Finalizing the Integration
Now that the rebase is finished, your `feat/fullgaps` branch is **perfectly updated**. It contains the Fullgaps logic, but written specifically to work with Pertag.

Now you merge it into `master`:
```bash
git checkout master
git merge feat/fullgaps
```
**Result:** This will be a "Fast-Forward" merge. No conflicts. Your `master` is now a clean, linear history of:
`Vanilla -> Pertag -> Fullgaps (adapted for pertag)`.

---

### Why is this better than Merge?

1.  **Linearity:** If you run `git log --oneline --graph`, you will see a single straight line. This makes it much easier to see the evolution of your build.
2.  **Isolation:** You are only ever dealing with the conflict between **one new patch** and **your existing build**. In a giant multi-branch merge, you might get confused about which patch introduced which variable.
3.  **The "Undo" Factor:** If you realize `fullgaps` is causing crashes, you can easily `git revert` the Fullgaps commit because it's a single, clean unit of work in your history.

### What about the next patch?
For your next branch, say `feat/status2d`:
1.  `git checkout feat/status2d`
2.  `git rebase master` (This brings in the combined Pertag + Fullgaps code).
3.  Resolve conflicts in `drawbar()`.
4.  `git checkout master` -> `git merge feat/status2d`.

**Repeat this for every patch.** By the time you get to the 9th patch, your "Feature Branch" is essentially a testing ground where you fix the code before "officially" moving it into your Master branch.