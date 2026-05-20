# 15 Minutes to Git Going

## Goal
Clone, edit, commit, and push.

## Who This Is For
Learners who need the shortest possible path to working with GitHub.

## What You Need
- Git installed
- GitHub account
- Access to a practice repo

## The Workflow
clone → edit → add → commit → push

## Activity
Make your first push.

## Cheat Sheet
The 5-command daily workflow.

## Next Lesson
Lesson 1: Git Basics, Local Repositories, and Intro to Remotes

---

# “15 Minutes to Git Going” Lesson

**Purpose:** Give learners just enough Git and GitHub to start using a repository, make a change, save it, and push it back to GitHub.

This should be a fast-start lesson, not a full explanation of Git.

---

# Learning Goal

By the end, learners can:

> Clone a GitHub repository, make a small change, commit it, and push it back to GitHub.

---

# What It Should Cover

## 1. What Git and GitHub Are — 1 minute

### Keep it very simple

* **Git** tracks changes to files.
* **GitHub** stores a copy of your Git project online.
* You work on your computer, then sync your work with GitHub.

### Avoid

* Deep history of version control
* Detailed Git internals
* Advanced collaboration models

---

## 2. The Basic Mental Model — 2 minutes

Use one simple diagram:

```text
GitHub repo
    ↓ clone
Your computer
    ↓ edit files
git add
    ↓
git commit
    ↓
git push
    ↓
GitHub repo updated
```

### Key ideas

* **Clone** = copy a GitHub repo to your computer
* **Add** = choose changes to save
* **Commit** = save a checkpoint
* **Push** = upload commits to GitHub

---

## 3. Setup Check — 2 minutes

### Confirm Git is installed

```bash
git --version
```

### Confirm Git identity

```bash
git config --global user.name
git config --global user.email
```

### Set identity if needed

```bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

### Confirm GitHub access

Learners should have:

* A GitHub account
* Access to the practice repository
* Permission to push, or a personal practice repo

---

## 4. Clone a Repository — 2 minutes

### Get the repository URL from GitHub

```bash
git clone <repo-url>
```

### Move into the repository folder

```bash
cd <repo-name>
```

### Check that it worked

```bash
git status
```

### Explain briefly

* Cloning downloads the project.
* It also connects your local copy to GitHub automatically.
* That connection is called a **remote**.

Optional quick check:

```bash
git remote -v
```

---

## 5. Make a Small Change — 1 minute

### Example changes

* Edit `README.md`
* Add your name to a class list
* Fix a typo
* Add a short note
* Create a file called `notes.md`

### Keep the change tiny

This lesson should avoid conflicts, branches, and multiple files unless necessary.

---

## 6. Save the Change with Git — 4 minutes

### Step 1: Check status

```bash
git status
```

Explain:

* Git shows what changed.
* Red files are usually unstaged.
* Green files are usually staged.

### Step 2: Stage the change

```bash
git add README.md
```

Or, for a tiny beginner exercise:

```bash
git add .
```

Explain:

* Staging means “include this in my next save.”

### Step 3: Commit the change

```bash
git commit -m "Add my note"
```

Explain:

* A commit is a saved checkpoint.
* The message should describe the change.

### Step 4: Push to GitHub

```bash
git push
```

Explain:

* Push sends your commit to GitHub.
* Refresh GitHub to see the change online.

---

## 7. Pull Before You Work — 1 minute

Introduce this as a habit, not a deep topic.

```bash
git pull
```

### Explain

* Pull gets the latest version from GitHub.
* Use it before making changes, especially in a shared repo.
* If Git reports a conflict, stop and ask for help in this fast-start lesson.

---

## 8. The 5-Command Daily Workflow — 2 minutes

This should be the main takeaway.

```bash
git pull
git status
git add .
git commit -m "Describe my change"
git push
```

### Explain as a loop

```text
Start by getting latest changes.
Check what changed.
Stage your changes.
Commit your changes.
Push them back to GitHub.
```

---

# What Not to Cover

This lesson should **not** cover:

* Branching
* Merging
* Pull requests
* Merge conflicts, except “ask for help”
* Rebasing
* Reset
* Stashing
* Forking
* GitHub Actions
* Git internals
* Detailed remote configuration
* SSH setup unless already required by the course

Those belong in later lessons.

---

---

# Suggested Hands-On Activity

## Activity: Make Your First Push

### Goal

Clone a GitHub repository, make a small edit, commit it, and push it.

### Steps

```bash
git clone <repo-url>
cd <repo-name>
git status
```

Edit `README.md`.

```bash
git status
git add README.md
git commit -m "Add my introduction"
git push
```

Then refresh GitHub and confirm the change appears.

---

# Suggested Learner Cheat Sheet

```bash
# Get a copy of a GitHub repo
git clone <repo-url>

# Move into the repo
cd <repo-name>

# Get the latest changes
git pull

# See what changed
git status

# Stage changes
git add .

# Save a commit
git commit -m "Describe the change"

# Send commits to GitHub
git push
```

---

# Suggested Page Structure for the Site

```text
/lessons/15min-to-git-going/
├── index.md
├── slides.md
├── notes.md
├── exercise.md
├── cheat-sheet.md
└── troubleshooting.md
```

## Main sections for `index.md`

```text
# 15 Minutes to Git Going

## Goal
Clone, edit, commit, and push.

## Who This Is For
Learners who need the shortest possible path to working with GitHub.

## What You Need
- Git installed
- GitHub account
- Access to a practice repo

## The Workflow
clone → edit → add → commit → push

## Activity
Make your first push.

## Cheat Sheet
The 5-command daily workflow.

## Next Lesson
Lesson 1: Git Basics, Local Repositories, and Intro to Remotes
```

---

# Best Version of the Lesson

The lesson should focus on the **GitHub-first workflow**:

```text
clone → edit → status → add → commit → push
```

Mention `git pull` as the first habit once the repo has already been cloned:

```text
pull → edit → status → add → commit → push
```

That gives learners the quickest usable path without overwhelming them.