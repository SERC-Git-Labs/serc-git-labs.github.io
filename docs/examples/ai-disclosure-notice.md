---
title: AI Disclosure Notice
layout: default
parent: Examples
nav_order: 8
ai:
  used: true
  code_generated: true
  role:
    - outline_generation
    - initial_drafting
    - example_generation
    - code_example_generation
  tools:
    - GitHub Copilot
    - ChatGPT 5.2
  human_reviewed: true
---

# {{ page.title }}

To include an AI disclosure notice on a page, use the following front matter in the page's content:

```yaml
ai:
  used: true
  code_generated: true
  role:
    - outline_generation
    - initial_drafting
    - example_generation
    - code_example_generation
  tools:
    - GitHub Copilot
    - ChatGPT 5.2
  human_reviewed: true
```

This will display a notice on the page indicating that AI was used in the creation of the content, along with the specific role(s) that the AI played and whether the content was reviewed by a human.
