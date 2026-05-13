---
title: Alternative Page Layouts
layout: default
parent: Examples
nav_order: 1
alt_layout: minimal
alt_url: examples/alternative-layout
---

# {{ page.title }}

To generate a page with an additional alternative layout, include the following front matter in the page's markdown file:

```yaml
alt_layout: <layout>
alt_url: <path>
```

Where `<layout>` is the name of the layout to use and `<path>` is the path to render the page to. The path should be relative to the site's root directory.

Alternative rendered pages do not appear in the site's navigation.

This page is rendered using the `minimal` layout and is available at <a href="javascript:void(0);" onclick="window.open('/examples/alternative-layout', '_blank', 'popup,width=600,height=600');">examples/alt-page</a>
