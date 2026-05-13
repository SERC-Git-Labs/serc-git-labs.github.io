---
title: Introduction to Git Exercise
layout: default
---
<!-- cspell:words oneline -->

# Introduction to Git Exercise

In this exercise you will use Git on your own Windows 11 computer without GitHub or an internet connection. The goal is to practise the basic local workflow: set up Git, create a project folder, start a repository, save changes, review history, and correct small mistakes.

## Before you start

Make sure Git for Windows is installed. Open **Git Bash** from the Start menu and use that terminal for the steps below. Git Bash is recommended because the commands match the examples exactly.

## 1. Configure Git

Git stores your name and email address in each commit so that every saved version has an author. Run these commands once on your computer, replacing the example values with your own details:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.name@example.com"
```

Check the settings:

```bash
git config --global --list
```

You should see your name and email in the output. The `--global` option means Git will reuse these details for future repositories on this computer.

## 2. Create a folder for the exercise

Create a new folder and move into it:

```bash
mkdir git-intro-exercise
cd git-intro-exercise
```

This gives you a clean workspace. Everything you do next will stay inside this folder.

## 3. Run `git init`

Start a new Git repository:

```bash
git init
```

Git creates a hidden `.git` folder to store the repository history. At this point Git is ready, but there are no files being tracked yet.

Check the repository state:

```bash
git status
```

`git status` is one of the most useful commands in Git. It tells you what branch you are on, which files are new or changed, and what Git is ready to save.

## 4. Add a file

Create a text file for your notes:

```bash
echo "# My Git Notes" > notes.txt
```

View the file:

```bash
cat notes.txt
```

Now ask Git what changed:

```bash
git status
```

You should see `notes.txt` listed as an untracked file. That means the file exists in the folder, but Git is not yet including it in version history.

Tell Git to start tracking the file:

```bash
git add notes.txt
```

Run `git status` again. The file should now be shown as ready to be committed. The `git add` command places changes in the staging area, which is like a draft of your next save point.

## 5. Commit the file

Create your first commit:

```bash
git commit -m "Add notes file"
```

A commit is a saved checkpoint in your project history. The message should explain what changed so that the history is easy to understand later.

Check the status again:

```bash
git status
```

Git should report that there is nothing to commit because your working folder matches the most recent saved version.

## 6. View history

Display the commit history:

```bash
git log --oneline
```

You should see your commit with a short commit ID and the message `Add notes file`. This history is local to your computer because you have not connected the repository to any remote service.

## 7. Fix simple mistakes

Git is helpful when you make small mistakes. Try the examples below.

### Mistake A: you forgot to update the file before committing again

Add another line:

```bash
echo "Git stores versions of files." >> notes.txt
```

Check the change:

```bash
git status
cat notes.txt
```

Stage and commit the update:

```bash
git add notes.txt
git commit -m "Add a description of Git"
```

### Mistake B: you typed the wrong commit message

If the most recent commit message needs corrected, use:

```bash
git commit --amend -m "Add a short description of Git"
```

This replaces the last commit message. It is safe here because you are working locally and have not shared the repository with anyone else.

### Mistake C: you changed a file and want to discard the change

Add an incorrect line on purpose:

```bash
echo "Git deletes all history every time you commit." >> notes.txt
```

Check the file, then restore the last committed version:

```bash
cat notes.txt
git restore notes.txt
cat notes.txt
```

`git restore` removes the unsaved change and brings the file back to the version from the latest commit.

## 8. Review your work

Run these commands one more time:

```bash
git status
git log --oneline
```

You should now have a small local Git repository with a short history and experience of fixing common beginner mistakes.

## Reflection

When you finish, make sure you can answer these questions:

- What is the difference between an untracked file and a staged file?
- What does `git init` create?
- Why is a clear commit message useful?
- When would `git commit --amend` be helpful?
- What does `git restore` do?
