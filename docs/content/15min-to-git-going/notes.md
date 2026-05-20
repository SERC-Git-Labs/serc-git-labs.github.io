````markdown
---
title: "15 Minutes to Git Going"
lesson: "15min-to-git-going"
duration: "15 minutes"
audience: "Beginners who need to start using Git and GitHub quickly"
---

# 15 Minutes to Git Going

## Lesson Goal

By the end of this short lesson, you will be able to:

- Clone a GitHub repository to your computer
- Make a small change
- Save that change with Git
- Push the change back to GitHub

The goal is not to learn everything about Git. The goal is to learn just enough to start using it.

---

## What You Need Before Starting

Before beginning, make sure you have:

- Git installed on your computer
- A GitHub account
- Access to a GitHub repository you can edit
- A terminal or command line application
- A text editor or code editor

---

# 1. Git and GitHub in One Minute

## What Is Git?

Git is a tool that tracks changes to files.

It lets you save checkpoints as you work so you can see what changed, when it changed, and who changed it.

## What Is GitHub?

GitHub is a website that stores Git repositories online.

You can use GitHub to:

- Back up your work
- Share code or files with others
- Collaborate on projects
- Review changes

## Simple Difference

| Tool | What it does |
|---|---|
| Git | Tracks changes on your computer |
| GitHub | Stores and shares Git repositories online |

---

# 2. The Basic Workflow

Most beginner Git work follows this pattern:

```text
clone → edit → add → commit → push
````

## What Each Step Means

| Step     | Meaning                                   |
| -------- | ----------------------------------------- |
| `clone`  | Copy a GitHub repository to your computer |
| `edit`   | Change files in the project               |
| `add`    | Choose which changes to save              |
| `commit` | Save a checkpoint in Git                  |
| `push`   | Send your saved work back to GitHub       |

## The Daily Workflow After Cloning

Once you already have the repo on your computer, the everyday workflow is:

```bash
git pull
git status
git add .
git commit -m "Describe your change"
git push
```

---

# 3. Check Your Setup

## Check That Git Is Installed

Open your terminal and run:

```bash
git --version
```

You should see a version number, such as:

```text
git version 2.x.x
```

If you see an error, Git may not be installed or your terminal cannot find it.

---

## Check Your Git Name

Run:

```bash
git config --global user.name
```

If your name appears, Git already has your name configured.

If nothing appears, set your name:

```bash
git config --global user.name "Your Name"
```

---

## Check Your Git Email

Run:

```bash
git config --global user.email
```

If your email appears, Git already has your email configured.

If nothing appears, set your email:

```bash
git config --global user.email "you@example.com"
```

Use the email address connected to your GitHub account if possible.

---

# 4. Clone a GitHub Repository

## What Cloning Means

Cloning means copying a repository from GitHub to your computer.

When you clone a repository, Git downloads:

* The project files
* The project history
* A connection back to the GitHub repository

That connection is called a **remote**.

---

## Copy the Repository URL

On GitHub:

1. Open the repository page
2. Click the green **Code** button
3. Copy the repository URL

The URL will usually look something like this:

```text
https://github.com/username/repository-name.git
```

---

## Clone the Repository

In your terminal, move to the folder where you want to keep your project.

Then run:

```bash
git clone <repo-url>
```

Example:

```bash
git clone https://github.com/username/repository-name.git
```

---

## Move Into the Repository Folder

After cloning, move into the new folder:

```bash
cd repository-name
```

You are now inside your local copy of the GitHub repository.

---

## Check That Git Recognizes the Folder

Run:

```bash
git status
```

You should see a message like:

```text
On branch main
Your branch is up to date with 'origin/main'.
nothing to commit, working tree clean
```

This means your local repository is ready.

---

# 5. Make a Small Change

Open the repository folder in your editor.

Make a tiny change, such as:

* Edit `README.md`
* Add your name to a list
* Fix a typo
* Add a short sentence
* Create a file called `notes.md`

Keep the change small for now.

---

# 6. Check What Changed

Return to your terminal and run:

```bash
git status
```

Git will show the files that changed.

You may see something like:

```text
Changes not staged for commit:
  modified: README.md
```

This means Git noticed the change, but it is not ready to be committed yet.

---

# 7. Stage the Change

## Stage One File

To stage one file:

```bash
git add README.md
```

## Stage All Changes

For this beginner exercise, you can also stage all changes:

```bash
git add .
```

## What Staging Means

Staging means:

> Include this change in my next saved checkpoint.

Git does not automatically commit everything you edit. You choose what to include.

---

# 8. Commit the Change

## Create a Commit

Run:

```bash
git commit -m "Add my note"
```

A commit is a saved checkpoint in your project history.

## Commit Message Tips

Good commit messages are short and specific.

Good examples:

```text
Add my introduction
Fix typo in README
Add setup notes
```

Weak examples:

```text
stuff
changes
final
update
```

---

# 9. Push the Change to GitHub

Run:

```bash
git push
```

This sends your local commit to GitHub.

After pushing:

1. Go back to the repository page on GitHub
2. Refresh the page
3. Confirm that your change appears online

You have now completed the basic GitHub workflow.

---

# 10. Pull Before You Work

When working with a GitHub repository, especially one shared with other people, start by pulling the latest changes.

Run:

```bash
git pull
```

## What Pull Does

`git pull` brings the latest changes from GitHub down to your computer.

Use it before making new changes.

A good habit is:

```bash
git pull
# then make your changes
git status
git add .
git commit -m "Describe your change"
git push
```

---

# 11. The Five-Command Daily Workflow

Once the repository is already cloned, this is the workflow to remember:

```bash
git pull
git status
git add .
git commit -m "Describe your change"
git push
```

## What Each Command Does

| Command                   | Meaning                            |
| ------------------------- | ---------------------------------- |
| `git pull`                | Get the latest changes from GitHub |
| `git status`              | See what changed                   |
| `git add .`               | Stage your changes                 |
| `git commit -m "message"` | Save a checkpoint                  |
| `git push`                | Send your commits to GitHub        |

---

# 12. Quick Practice Activity

## Activity: Make Your First Push

### Goal

Clone a repository, make a small change, commit it, and push it to GitHub.

### Step 1: Clone the repository

```bash
git clone <repo-url>
```

### Step 2: Move into the folder

```bash
cd <repo-name>
```

### Step 3: Check the repository

```bash
git status
```

### Step 4: Make a small change

Edit `README.md` or another simple file.

### Step 5: Check what changed

```bash
git status
```

### Step 6: Stage the change

```bash
git add .
```

### Step 7: Commit the change

```bash
git commit -m "Add my first change"
```

### Step 8: Push the change

```bash
git push
```

### Step 9: Confirm on GitHub

Refresh the GitHub repository page and check that your change appears.

---

# 13. Common Problems

## Problem: `git` command not found

### What it means

Git is not installed, or your terminal cannot find it.

### What to do

Install Git, then reopen your terminal and try:

```bash
git --version
```

---

## Problem: I cloned the repo, but I cannot find it

### What it means

The repository was downloaded into the folder where your terminal was located.

### What to do

Run:

```bash
ls
```

or on Windows Command Prompt:

```cmd
dir
```

Look for the repository folder, then move into it:

```bash
cd <repo-name>
```

---

## Problem: `nothing to commit, working tree clean`

### What it means

Git does not currently see any unsaved changes.

### Possible reasons

* You did not save the file in your editor
* You edited the wrong folder
* You already committed the change
* You are not inside the repository folder

### What to try

Run:

```bash
git status
```

Make sure you are inside the correct project folder.

---

## Problem: Push was rejected

### What it means

GitHub has changes that your local copy does not have.

### What to try

Run:

```bash
git pull
```

Then try pushing again:

```bash
git push
```

If Git reports a conflict, stop and ask for help.

---

## Problem: Permission denied

### What it means

GitHub does not think you have permission to push to this repository.

### Possible reasons

* You are not signed in correctly
* You do not have write access to the repository
* Your authentication method is not set up
* You are using the wrong repository URL

### What to do

Check that:

* You are using the correct GitHub account
* You have access to the repository
* You copied the correct clone URL

---

# 14. What to Do When Something Goes Wrong

When Git shows an error:

1. Read the message carefully
2. Do not panic
3. Do not randomly run commands from the internet
4. Check which folder you are in
5. Run:

```bash
git status
```

6. Ask for help if you are unsure

`git status` is usually the safest first command when you are confused.

---

# 15. Cheat Sheet

## Start From GitHub

```bash
git clone <repo-url>
cd <repo-name>
```

## Check the Repository

```bash
git status
```

## Save and Push a Change

```bash
git add .
git commit -m "Describe your change"
git push
```

## Daily Workflow

```bash
git pull
git status
git add .
git commit -m "Describe your change"
git push
```

## Check the Remote

```bash
git remote -v
```

---

# 16. Key Terms

## Git

A tool for tracking changes to files.

## GitHub

A website for hosting and sharing Git repositories.

## Repository

A project folder tracked by Git.

## Clone

A copy of a GitHub repository downloaded to your computer.

## Commit

A saved checkpoint in Git history.

## Push

Send local commits to GitHub.

## Pull

Get the latest changes from GitHub.

## Remote

A linked copy of the repository hosted somewhere else, usually GitHub.

## Origin

The default name Git gives to the remote repository when you clone from GitHub.

---

# 17. Check Your Understanding

Answer these questions:

1. What is the difference between Git and GitHub?
2. What does `git clone` do?
3. What does `git status` show you?
4. What is the difference between `git add` and `git commit`?
5. What does `git push` do?
6. Why should you run `git pull` before starting work?
7. What command should you run first when you are confused?

---

# 18. You Can Now

You can now:

* Copy a GitHub repository to your computer
* Make a small change
* Check what changed
* Stage your change
* Commit your change
* Push your work to GitHub
* Start future work with `git pull`

Next, you are ready to learn Git in more depth.
