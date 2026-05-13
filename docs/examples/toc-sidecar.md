---
title: Table of Contents Sidecar
layout: page
description: A sidecar for the Table of Contents
nav_order: 4
parent: Examples
---

# {{ page.title }}

This example shows how to create a sidecar for the Table of Contents.

## Contents
{: .no_toc .text-delta }

1. TOC
{:toc .toc_sidecar}

## Usage

To include a sidecar for the Table of Contents, add the `.toc_sidecar` class to the `toc` element. For example:

```markdown
1. TOC
{:toc .toc_sidecar}
```

The sidecar will be hidden while the Table of Contents is visible. When the Table of Contents is no longer in the viewport, the sidecar visibility will be toggled.

Including a sidecar for the Table of Contents is useful when the page content is long and the Table of Contents is not visible in the viewport. The sidecar provides a way for the user to quickly navigate to a different section of the page.

## Increasing Page Content

To see the sidecar in action, increase the page content by adding more headings  and content to the page. For example:

```markdown
## Contents
{: .no_toc .text-delta }

1. TOC
{:toc .toc_sidecar}

## Heading 1

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eu ultricies ultricies, nunc elit ultricies nunc, vitae ultricies nisl nisl vitae elit. Donec euismod, nisl eu ultricies ultricies, nunc elit ultricies nunc, vitae ultricies nisl nisl vitae elit.

## Heading 2

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eu ultricies ultricies, nunc elit ultricies nunc, vitae ultricies nisl nisl vitae elit. Donec euismod, nisl eu ultricies ultricies, nunc elit ultricies nunc, vitae ultricies nisl nisl vitae elit.

### Heading 2.1

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eu ultricies ultricies, nunc elit ultricies nunc, vitae ultricies nisl nisl vitae elit. Donec euismod, nisl eu ultricies ultricies, nunc elit ultricies nunc, vitae ultricies nisl nisl vitae elit.

### Heading 2.2

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eu ultricies ultricies, nunc elit ultricies nunc, vitae ultricies nisl nisl vitae elit. Donec euismod, nisl eu ultricies ultricies, nunc elit ultricies nunc, vitae ultricies nisl nisl vitae elit.

## Heading 3

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eu ultricies ultricies, nunc elit ultricies nunc, vitae ultricies nisl nisl vitae elit. Donec euismod, nisl eu ultricies ultricies, nunc elit ultricies nunc, vitae ultricies nisl nisl vitae elit.

### Heading 3.1

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eu ultricies ultricies, nunc elit ultricies nunc, vitae ultricies nisl nisl vitae elit. Donec euismod, nisl eu ultricies ultricies, nunc elit ultricies nunc, vitae ultricies nisl nisl vitae elit.

### Heading 3.2

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl eu ultricies ultricies, nunc elit ultricies nunc, vitae ultricies nisl nisl vitae elit. Donec euismod, nisl eu ultricies ultricies, nunc elit ultricies nunc, vitae ultricies nisl nisl vitae elit.
```
{: .pre-wrap }

## Customizing the Sidecar

The sidecar is a `div` element with the `.toc_sidecar` class. You can customize the sidecar by adding CSS to your site. For example:

```css
.toc_sidecar {
  background-color: #f5f5f5;
  border: 1px solid #e5e5e5;
  border-radius: 3px;
  padding: 1rem;
}
```

