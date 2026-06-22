---
title: Branching and Merging Exercise
layout: default
---

# Branching and merging in Git

In this exercise, you will work entirely on your own Windows 11 computer. You will create a Git repository, make a feature branch, merge that branch back into `main`, and then create and resolve a small merge conflict.

The aim is to understand why branches are useful, what a merge does, and what Git is asking you to do when two versions of the same line conflict.

## Learning goals

By the end of this exercise, you should be able to:

- create a local Git repository
- create and switch to a feature branch
- make commits on different branches
- merge a feature branch into `main`
- recognise a merge conflict
- resolve a merge conflict and complete the merge

## Before you start

You will need:

- Windows 11
- Git for Windows installed
- Git Bash
- a text editor such as Notepad or Visual Studio Code

Throughout this exercise, use **Git Bash** for commands. Git Bash gives you a Unix-like terminal on Windows, and it is a common way to use Git locally.

## Part 1: Create a local repository

1. Open **Git Bash**.
2. Move to a folder where you want to keep your practice work. For example:

   ```bash
   cd /c/Users/your-username/Documents
   ```

3. Create a new folder and move into it:

   ```bash
   mkdir git-branch-merge-practice
   cd git-branch-merge-practice
   ```

4. Create a new Git repository:

   ```bash
   git init -b main
   ```

   This creates a new repository and starts it with a branch called `main`. A branch is simply a named line of development.

5. Create a file called `notes.txt` and add the following text:

   ```text
   Git branching practice
   This file will be used for a merge exercise.
   ```

6. Save the file, then stage and commit it:

   ```bash
   git add notes.txt
   git commit -m "Create starting notes file"
   ```

   This first commit gives Git a saved starting point. Commits act like checkpoints in your project history.

7. Check the current status and history:

   ```bash
   git status
   git log --oneline
   ```

   You should see a clean working tree and one commit.

## Part 2: Create and use a feature branch

1. Create a new branch called `feature-update-notes` and switch to it:

   ```bash
   git switch -c feature-update-notes
   ```

   This creates a new branch from your current commit and moves you onto it. From now on, your new commits will belong to this branch until you switch away.

2. Confirm which branch you are on:

   ```bash
   git branch
   ```

   Git marks the current branch with an asterisk (`*`).

3. Edit `notes.txt` so it now says:

   ```text
   Git branching practice
   This file was updated on a feature branch.
   Branches let you work on changes safely.
   ```

4. Stage and commit the change:

   ```bash
   git add notes.txt
   git commit -m "Update notes on feature branch"
   ```

5. View the history again:

   ```bash
   git log --oneline --decorate --all
   ```

   Notice that `feature-update-notes` now points to a newer commit than `main`. This is the main purpose of branching: you can develop work separately without changing the main line immediately.

## Part 3: Merge the feature branch into `main`

1. Switch back to `main`:

   ```bash
   git switch main
   ```

2. Merge the feature branch:

   ```bash
   git merge feature-update-notes
   ```

   Git should complete this merge automatically. Because `main` has not changed since you created the feature branch, Git can combine the histories without any confusion.

3. Check the result:

   ```bash
   git log --oneline --decorate --all
   cat notes.txt
   ```

   You should see the updated file contents on `main`. At this point, the work from your feature branch is now part of the main branch.

## Part 4: Create a merge conflict on purpose

A merge conflict happens when Git cannot decide how to combine changes automatically. This usually happens when two branches change the same part of the same file in different ways.

To practise resolving one, you will now make different edits to the same line on two branches.

1. Make sure you are on `main`:

   ```bash
   git branch
   ```

2. Create a new branch for the conflict exercise:

   ```bash
   git switch -c conflict-practice
   ```

3. Edit `notes.txt` and change the second line so the file becomes:

   ```text
   Git branching practice
   This line was edited on the conflict-practice branch.
   Branches let you work on changes safely.
   ```

4. Save the file and commit the change:

   ```bash
   git add notes.txt
   git commit -m "Edit line on conflict-practice branch"
   ```

5. Switch back to `main`:

   ```bash
   git switch main
   ```

6. Edit `notes.txt` again, but this time change the same second line to:

   ```text
   Git branching practice
   This line was edited differently on the main branch.
   Branches let you work on changes safely.
   ```

7. Save the file and commit the change:

   ```bash
   git add notes.txt
   git commit -m "Edit same line on main branch"
   ```

8. Try to merge the branch into `main`:

   ```bash
   git merge conflict-practice
   ```

   This time Git should report a conflict. Git knows both branches changed the same line, but it does not know which version you want to keep.

## Part 5: Resolve the conflict

1. Check the repository status:

   ```bash
   git status
   ```

   Git will tell you that `notes.txt` has conflicts.

2. Open `notes.txt`. You should see conflict markers that look similar to this:

   ```text
   Git branching practice
   <<<<<<< HEAD
   This line was edited differently on the main branch.
   =======
   This line was edited on the conflict-practice branch.
   >>>>>>> conflict-practice
   Branches let you work on changes safely.
   ```

   These markers show the competing versions. `HEAD` is your current branch, which is `main` in this exercise.

3. Decide what the final version should be. For example, replace the conflict section with:

   ```text
   Git branching practice
   This line was edited on both branches and merged into one final version.
   Branches let you work on changes safely.
   ```

   When you resolve a conflict, you remove the markers and leave only the final content you want Git to keep.

4. Stage the resolved file:

   ```bash
   git add notes.txt
   ```

5. Complete the merge with a commit:

   ```bash
   git commit -m "Resolve merge conflict in notes file"
   ```

6. Review the finished history:

   ```bash
   git log --oneline --decorate --all --graph
   ```

   The graph helps you see where the branch split, where work happened separately, and where the histories came back together.

## Reflection

After finishing, make sure you can answer these questions:

1. Why is it useful to create a feature branch instead of working directly on `main`?
2. Why did the first merge complete automatically?
3. Why did the second merge produce a conflict?
4. What do the conflict markers mean?
5. What steps are needed to finish a merge after resolving a conflict?

If you can answer those clearly and repeat the exercise without looking at the instructions, you have understood the core branching and merging workflow.
