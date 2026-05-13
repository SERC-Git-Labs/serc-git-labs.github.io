---
title: Reading Time
layout: default
parent: Examples
nav_order: 2
---

# {{ page.title }}

{% include reading_time.html content=page.content %}

To include an estimate of the time it will take to read a page, include the following liquid tag in the page's content where you want the reading time to be displayed:

{% raw %}
```markdown
{% include reading_time.html content=page.content %}
```
{% endraw %}
