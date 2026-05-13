---
title: Modal Popup
layout: default
description: How to create a modal popup.
nav_order: 5
parent: Examples
---

# {{ page.title }}

This example shows how to create a modal popup.

Some content, such as images or tables, may be too large to easily display on a page. In these cases, it may be useful to offer the user a way to view the content in a modal popup.

## Usage

To create a popup modal for content on a page, add the `.modal-popup` class to the element containing the content. For example:

```markdown
![Image](/assets/images/picsum-image-1.jpg)
{: .modal-popup }
```

The modal popup will be hidden until the user clicks on the element. When the user clicks on the element, the modal popup will be displayed.

## Example

Click on the image below to see the modal popup in action.

![Image](https://picsum.photos/1920/1080)
{: .modal-popup }
