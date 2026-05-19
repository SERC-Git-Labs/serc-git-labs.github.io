---
title: Slides
layout: default
parent: "1: Git Basics"
nav_order: 2
ai:
  used: true
  role:
    - outline_generation
    - image_generation
  tools:
    - ChatGPT 5.5
    - GitHub Copilot
  human_reviewed: true
  notice_size: small
slides:
  theme: 'black'
  slideNumber: 'true'
  transition: 'slide'
---

<!-- markdownlint-disable MD025 MD034 MD045 -->

## Lesson 1 - Git Basics

Introduction to Git, and some basic git commands.

<br />

<!-- <img src="assets/svg/Git-Logo-2Color.svg" alt="Git logo" style="max-width:90%; max-height:120px;"> -->
<img src="assets/svg/Git-Logo-White.svg" alt="Git logo" style="max-width:90%; max-height:120px;">

::: notes
Git Logo by Jason Long is licensed under the Creative Commons Attribution 3.0 Unported License.
:::

---

### What You’ll Learn Today
<!-- [TODO: change slide title] -->

* What is Git and why use it
* How repositories work
* Create a repository with `git init`
* Copy a repository with `git clone`
* How to commit changes
* How to push changes to a remote

<img src="assets/svg/1-what-youll-learn-roadmap.svg" alt="Roadmap timeline showing 6 learning steps: Git and GitHub, Repos, git init, git clone, Commit, Push to GitHub" style="width:100%; max-width:860px;">

---

## What is Git and Why Use It

---

### Why Version Control Matters

* Track changes over time
* Recover from mistakes
* Compare versions
* Collaborate safely
* Build a project history

<img src="assets/svg/2-version-control-chaos-vs-git.svg" alt="Left side shows chaotic file naming without Git (report_final_v2_REAL.docx, etc.). Right side shows a clean Git commit history with meaningful messages." style="width:100%; max-width:860px;">

::: notes
Version control is a fundamental tool for software development and increasingly for data science and other fields. It allows you to manage changes to your project over time, collaborate with others, and maintain a history of your work.
:::

---

### History of Version Control

* Version control has been around since the 1970s
* Early systems were centralized (e.g. CVS, Subversion)
* Git introduced in 2005 as a distributed system
* Distributed VCS allows for local commits and offline work

<img src="assets/svg/3-vcs-timeline-detailed.svg" alt="Version control systems timeline from 1972 SCCS through 2006 TFS showing the transition from centralized systems (CVS, Subversion, Perforce) to distributed systems (Git, Mercurial, Bazaar)" style="width:100%; max-width:1000px;">
<!-- 
**image**: diagram showing timeline of version control systems,
- 1972 SCCS
- 1982 RCS
- 1990 CVS
- 1995 Perforce
- 2000 Subversion
- 2005 Git, Mercurial, Bazaar
- 2006 TFS
with central,distributed groups
-->

::: notes
Version control is sometimes called source control, source code management (SCM), or just versioning. The terms are often used interchangeably, but VCS and SCM can have slightly different connotations.
VCS - Version Control System.
SCM - Source Code Management.

Version control has evolved over decades, with Git (and other VCS releases around the same time) representing a major shift to distributed version control. This allows for more flexible workflows and better support for collaboration.

:::

---

### Why Git?

* Fast and efficient
* Flexible branching and merging
* Large ecosystem and community
* Widely adopted in industry
* GitHub makes it easy to share and collaborate

<img src="assets/svg/4-git-popularity-market-share.svg" alt="Bar chart of version control usage showing Git at 93.87 percent, Subversion at 5.18 percent, None at 4.31 percent, and Mercurial at 1.13 percent" style="width:100%; max-width:980px;">

::: notes
Data source: Stack Overflow Developer Survey 2022, showing version control usage among developers. [https://survey.stackoverflow.co/2022/#version-control-version-control-system]
:::

---

### What Is Git?

* Git is a distributed version control system
* Created by Linus Torvalds for Linux development
* Free and open source software
* Fast, flexible, and widely adopted

<img src="assets/svg/5-centralized-vs-distributed-vcs-dark.svg" alt="Diagram comparing centralized version control (central server, CVS/Subversion) and distributed version control (multiple local Git repositories)" style="width:100%; max-width:900px;">

::: notes
Originally, Linux used BitKeeper, a proprietary VCS, but in 2005 the relationship between the Linux community and BitKeeper's owner broke down. Linus Torvalds created Git as a new distributed VCS to meet the needs of Linux development. The design of Git was influenced by the strengths and weaknesses of existing VCS (a particular dislike of CVS's handling of branching and merging).
Git's distributed nature allows for more flexible workflows, better support for branching and merging, and improved performance.

Interestingly, during the same weekend as Git's initial creation, another Linux kernel developer tried to solve the same problem by creating Mercurial, another distributed VCS.
:::

---

### Git vs. GitHub

* Git = tool installed on your computer
* GitHub = website for hosting and sharing Git repos
* Git works offline
* GitHub helps teams collaborate

<img src="assets/svg/6-git-vs-github-split.svg" alt="Split screen: left panel shows a laptop with a terminal running Git commands, labeled Git — tool installed on your computer. Right panel shows a cloud with a GitHub repo URL, labeled GitHub — website for hosting and sharing repos." style="width:100%; max-width:860px;">

---

## Using Git

---

### What Is a Repository?

* A project folder tracked by Git
* Contains files plus hidden Git history
* Git stores snapshots of changes
* Repositories can be local or remote

<img src="assets/svg/7-repository-folder.svg" alt="Folder named my-project containing README.md, index.html, and a highlighted hidden .git directory with config, HEAD, objects, and refs inside." style="width:100%; max-width:860px;">

---

### Local vs. Remote Repositories

* Local repo: on your computer
* Remote repo: hosted elsewhere, usually GitHub
* You work locally, then sync changes
* Remote repos help with backup and collaboration

<img src="assets/svg/8-local-remote-repos.svg" alt="Local repository on the left with git push arrow pointing right to GitHub, and git pull arrow pointing left back to local." style="width:100%; max-width:860px;">

::: notes
[TODO]
Strictly speaking, a remote repository doesn't have to be on a separate server, it just has to be a separate repository that you push and pull to. You could have two repositories on the same machine and push and pull between them. But in practice, remote repositories are usually hosted on platforms like GitHub, GitLab, or Bitbucket.
:::

---

### Two Ways to Start

1. Create a new repo with `git init`
2. Copy an existing remote repo with `git clone`

**Key idea:** Both paths lead to a local Git repository.

<img src="assets/svg/9-two-ways-to-start.svg" alt="Two paths - git init from a local folder and git clone from GitHub - both converge into a single Local Repository box." style="width:100%; max-width:860px;">

::: notes

:::

---

### Path 1 - Starting with `git init`

```bash
mkdir my-project
cd my-project
git init
```

* Creates a new Git repo in an existing folder
* Adds a hidden `.git` directory
* Best when starting a brand-new local project

<img src="assets/svg/10-git-init-folder.svg" alt="Before: empty my-project folder with no Git tracking. After running git init: same folder now contains a hidden .git directory." style="width:100%; max-width:860px;">

---

### Path 2 - Starting with `git clone`

```bash
git clone <repo-url>
cd <repo-name>
```

* Copies an existing remote repo to your computer
* Includes files and Git history
* Automatically connects to the remote as `origin`

<img src="assets/svg/11-git-clone-download.svg" alt="GitHub cloud on the left with an arrow labeled git clone pointing to a laptop on the right showing the cloned repo with files and git history." style="width:100%; max-width:860px;">

---

### The Basic Git Workflow

1. Edit files
2. Check status
3. Stage changes
4. Commit changes
5. Push to GitHub

<img src="assets/svg/12-git-workflow-circle.svg" alt="Circular workflow diagram with five steps: Edit Files, git status, git add, git commit, git push — connected in a cycle." style="width:100%; max-width:860px;">

::: notes
[TODO notes about git being deliberate, not automatic: and why this is good]
:::

---

### The 3 Areas of Git

* Working directory: files you are editing
* Staging area: changes selected for commit
* Repository: saved project history

```bash
git status
git add
git commit
```

<img src="assets/svg/13-working-staging-repo.svg" alt="Three boxes: Working Directory on left with changed files, arrow labeled git add to Staging Area in center with selected files, arrow labeled git commit to Repository on right showing commit history." style="width:100%; max-width:860px;">

::: notes
[TODO]
:::

---

### Checking Your Repo with `git status`

```bash
git status
```

* Shows changed files
* Shows staged and unstaged changes
* Helps you know what Git sees

<img src="assets/svg/14-git-status-terminal.svg" alt="Terminal window showing git status output with modified and untracked files listed in red." style="width:100%; max-width:860px;">

---

### Slide 13: Staging Changes with `git add`

```bash
git add filename
git add .
```

* `git add filename` stages one file
* `git add .` stages all current changes
* Staging lets you choose what goes into the next commit

<img src="assets/svg/slide13-staging-files.svg" alt="Two changed files with arrows pointing into a staging area box, a third file with a dashed arrow marked not staged, then arrow from staging area to commit." style="width:100%; max-width:860px;">

---

### Slide 14: Saving Changes with `git commit`

```bash
git commit -m "Add homepage"
```

* A commit is a saved snapshot
* Commit messages should explain the change
* Good commits are small and focused

<img src="assets/svg/slide14-commit-timeline.svg" alt="Horizontal timeline with four labeled commit points: Initial commit, Add homepage, Fix typo, and Add styles marked as HEAD." style="width:100%; max-width:860px;">

---

### Slide 15: Viewing History with `git log`

```bash
git log
git log --oneline
```

* Shows previous commits
* Includes commit ID, author, date, and message
* Useful for understanding project history

<img src="assets/svg/slide15-git-log-history.svg" alt="Terminal showing git log --oneline output with four commits listed, HEAD pointing to the most recent." style="width:100%; max-width:860px;">

---

### Slide 16: Comparing Changes with `git diff`

```bash
git diff
```

* Shows what changed before committing
* Helps review your work
* Reduces accidental commits

<img src="assets/svg/slide16-git-diff-comparison.svg" alt="Terminal showing git diff output with a removed line in red prefixed with minus and an added line in green prefixed with plus." style="width:100%; max-width:860px;">

---

### Slide 17: Intro to Remotes

* A remote is a linked copy of your repo hosted elsewhere
* GitHub repos are commonly used as remotes
* `origin` is the default remote name
* Remotes let you push and pull work

**Command:**

```bash
git remote -v
```

<img src="assets/svg/slide17-remote-origin.svg" alt="Local repository on left connected via git push and git pull arrows to GitHub origin on right, labeled with github.com/user/repo." style="width:100%; max-width:860px;">

---

### Slide 18: Pushing Changes to GitHub

```bash
git push
```

* Sends local commits to the remote repo
* Updates GitHub with your latest work
* Requires permission to push

<img src="assets/svg/slide18-git-push.svg" alt="Local repository on left with a bold arrow labeled git push pointing right to a GitHub cloud showing the repo is now up to date." style="width:100%; max-width:860px;">

---

### Slide 19: Pulling Changes from GitHub

```bash
git pull
```

* Brings remote changes down to your computer
* Keeps your local repo up to date
* Mention only briefly; deeper syncing comes later

<img src="assets/svg/slide19-git-pull.svg" alt="GitHub cloud on the left with a bold arrow labeled git pull pointing right to a local repository showing the new commit has been downloaded." style="width:100%; max-width:860px;">

---

### Slide 20: Demo - Local-First Workflow

Demo steps:

1. Create folder
2. Run `git init`
3. Add a file
4. Stage and commit
5. View history

<img src="assets/svg/slide20-demo-checklist.svg" alt="Numbered checklist of five demo steps: Create folder, git init, Add a file, Stage and commit, View history with git log." style="width:100%; max-width:860px;">

---

### Slide 21: Demo - GitHub-First Workflow

Demo steps:

1. Open GitHub repo
2. Copy clone URL
3. Run `git clone`
4. Edit a file
5. Commit
6. Push

<img src="assets/svg/slide21-github-first-workflow.svg" alt="Three panels: GitHub repo page with clone URL on left, terminal with git clone, edit, commit, push commands in the middle, and updated GitHub repo on the right." style="width:100%; max-width:860px;">

---

### Slide 22: Hands-On Activity

Students complete:

* `git init` workflow
* `git clone` workflow
* One commit in each repo
* One push to GitHub

<img src="assets/svg/slide22-practice-checklist.svg" alt="Checklist with four items: complete git init workflow, complete git clone workflow, make one commit in each repo, push changes to GitHub." style="width:100%; max-width:860px;">

---

### Slide 23: Common Mistakes

* Forgetting to `cd` into the repo
* Forgetting to stage before commit
* Trying to push without committing
* Cloning into the wrong folder
* Confusing Git with GitHub

<img src="assets/svg/slide23-common-mistakes.svg" alt="Table of five common mistakes on the left with their fixes on the right, including forgetting cd, forgetting git add, pushing without committing, cloning to the wrong folder, and confusing Git with GitHub." style="width:100%; max-width:860px;">

---

### Slide 24: Key Commands Recap

```bash
git init
git clone
git status
git add
git commit
git log
git diff
git remote -v
git push
git pull
```

<img src="assets/svg/slide24-command-cheatsheet.svg" alt="Two-column cheat sheet of all ten key Git commands with short descriptions, plus a tip to use git status often." style="width:100%; max-width:860px;">

---

### Slide 25: Wrap-Up

By now, students can:

* Explain Git vs. GitHub
* Create a repo with `git init`
* Clone a repo with `git clone`
* Commit changes
* Push to GitHub

<img src="assets/svg/slide25-wrap-up-summary.svg" alt="Summary visual: local repository on the left with commit history, bidirectional arrows for git push and git pull, and GitHub origin on the right labeled as backup and collaboration." style="width:100%; max-width:860px;">
