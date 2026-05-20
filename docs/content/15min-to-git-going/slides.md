

# Suggested Slide Outline

## Slide 1: 15 Minutes to Git Going

**Content:** Today’s goal: clone, edit, commit, push.
**Graphic:** GitHub → laptop → GitHub.

## Slide 2: Git vs. GitHub

**Content:** Git tracks changes. GitHub stores and shares repos online.
**Graphic:** Laptop labeled Git, cloud labeled GitHub.

## Slide 3: The Basic Workflow

**Content:**

```text
clone → edit → add → commit → push
```

**Graphic:** Simple arrow diagram.

## Slide 4: Check Your Setup

**Content:**

```bash
git --version
git config --global user.name
git config --global user.email
```

**Graphic:** Terminal checklist.

## Slide 5: Clone the Repo

**Content:**

```bash
git clone <repo-url>
cd <repo-name>
git status
```

**Graphic:** GitHub repo copied to laptop.

## Slide 6: Make a Tiny Change

**Content:** Edit `README.md` or add a short note.
**Graphic:** File edit icon.

## Slide 7: Save the Change

**Content:**

```bash
git status
git add .
git commit -m "Add my note"
```

**Graphic:** Working files → staged files → commit.

## Slide 8: Push to GitHub

**Content:**

```bash
git push
```

Refresh GitHub and confirm your change.
**Graphic:** Laptop upload arrow to GitHub.

## Slide 9: Pull Before You Work

**Content:**

```bash
git pull
```

Start by getting the latest version.
**Graphic:** GitHub download arrow to laptop.

## Slide 10: The Daily Git Loop

**Content:**

```bash
git pull
git status
git add .
git commit -m "Describe my change"
git push
```

**Graphic:** Circular workflow.

## Slide 11: When Something Goes Wrong

**Content:**

* Read the message
* Do not panic
* Do not randomly run commands
* Ask for help or check troubleshooting
  **Graphic:** Warning sign plus lifebuoy.

## Slide 12: You Can Now

**Content:**

* Clone a repo
* Make a change
* Commit it
* Push it to GitHub
* Start each session with `git pull`
  **Graphic:** Completion checklist.


