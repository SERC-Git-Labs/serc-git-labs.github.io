# SERC Git Labs

[SERC Git Labs](https://github.dev/SERC-Git-Labs) is a collection of labs used in the delivery of teaching Git and GitHub at [South Eastern Regional College](https://www.serc.ac.uk).

This repository contains learning materials, including lab instructions, reference guides, and a glossary of terms. The materials are designed to be used in conjunction with practical exercises to provide a comprehensive learning experience.

## Repository Structure

`docs/` contains the built site. This is the folder that is served by GH Pages.

## Features

- Theme is based on the [Just the Class](https://kevinl.info/just-the-class/) Jekyll theme.
- Custom plugin for rendering alternative page layouts.
- Custom plugin for calculating reading time for pages.
- AI disclosure notice for transparent AI-assisted content.
- Slideshows from markdown, to both HTML and PowerPoint.
- ToC sidecar for long pages.
- Modal popups for large content.
- VSCode settings for development environment.
- GitHub Actions workflow for building and deploying site to GitHub Pages.
- GitHub Actions workflow for linting and testing site.
- GitHub Actions workflow for automatically labelling pull requests.

## Usage

### Clone Template

1. Use the green "Template" button to create a new repository.

### Enable GitHub Pages

1. Go to the [repository settings -> pages](settings/pages).
2. Under the "GitHub Pages" section, for source select "GitHub Actions".

### Development

#### Dev Containers

Configuration for two dev containers is provided:

- Jekyll: this includes the Ruby and Jekyll dependencies for building the site. This is the recommended container for local development as it is much smaller than the universal container.
- Universal: this is the default container for GitHub Codespaces. It includes the Ruby and Jekyll dependencies along with many other tools that may be useful for development. This is the recommended container for developing in GitHub Codespaces as it is much faster to launch than the Jekyll container.

If you want to develop without using a dev container you will need to install the following:

- [Ruby](https://www.ruby-lang.org/en/downloads/)

#### Build Site Locally

To build and serve the site locally:

1. Change to the docs directory: `cd docs`.
2. Run `bundle install` to install the required gems.
3. Run `bundle exec jekyll serve --watch --incremental --livereload` to build and serve the site locally. (This will also watch for changes and rebuild the site as needed.) (If you are using Docker Desktop on Windows you will also need to include the `--force_polling` option.)

#### Pull Changes from Template

To pull changes from the template:

1. Add the template as a remote: `git remote add template https://github.com/SERC-Computing/Jekyll-Theme-Template.git`.
2. Fetch changes from the template: `git fetch template`.
3. As the template repository history is unrelated to the new repository history, it is easiest to cherry pick the changes you want to pull in: `git cherry-pick <commit-sha>`.

## Custom Features

Custom features are demonstrated in the [examples](docs/examples) directory. The examples directory should be deleted when using the template to create a new repository.

### Alternative Page Layouts

The alternative page layouts plugin allows for pages to be rendered to an alternative path and with an alternative layout. This is useful for when content is to be embedded on another site, such as a course Moodle page.

To use this feature, add the following to the page's front matter:

```yaml
alt_layout: <layout>
alt_url: <path>
```

Where `<layout>` is the name of the layout to use and `<path>` is the path to render the page to.

Alternative rendered pages do not appear in the site's navigation.

### Reading Time

The reading_time plugin estimates the time it will take to read a page Include the following liquid tag in the page's content where you want the reading time to be displayed:

```markdown
{% include reading_time.html content=page.content %}
```

### Slides

Markdown pages can be rendered as slideshows. To do so, include a `slides` attribute in the page's front matter, as such:

```yaml
slides: true
```

Additional configuration options can be specified:

```yaml
slides:
  theme: 'moon'
  slideNumber: 'true'
  transition: 'slide'
```

Site wide defaults can be specified in the `_config.yml` file using the same attributes that are available in the page's front matter.

Slides are rendered using [Pandoc](https://pandoc.org). See the [Pandoc documentation](https://pandoc.org/MANUAL.html#slide-shows) for structuring and formatting slides.

#### HTML Slides

The slides are rendered using the [reveal.js](https://revealjs.com/) backend. Page content is replaced with the rendered slides. The slides are also available as a separate page at the path `<page-url>/slides`.

Configuration options for reveal.js can be specified under the `slides` attribute in the page's front matter or site's `_config` file. See the [reveal.js documentation](https://revealjs.com/) for the different customisation options available.

#### PowerPoint Slides

PowerPoint slides are rendered via the [`create-powerpoints.yml`](.github/workflows/create-powerpoints.yml) GitHub Actions workflow. The files are uploaded as artifacts and can be downloaded from the Actions tab.

A reference pptx file is used as a template for the slides. This file should be called `reference.pptx` and placed in the `additional-files` directory. A reference file is already included in this repository. For how Pandoc selects the layout to use, see the Pandoc documentation on [PowerPoint layout choice](https://pandoc.org/MANUAL.html#powerpoint-layout-choice).

### Table of Contents Sidecar

The `toc_sidecar` class is a custom CSS class that can be applied to the ToC to create a sidecar for the ToC. The sidecar will be hidden while the ToC is visible. When the ToC is no longer in the viewport, the sidecar visibility will be toggled.

Including a sidecar for the ToC is useful when the page content is long and the ToC is not visible in the viewport. The sidecar provides a way for the user to quickly navigate to a different section of the page.

To include a sidecar for the ToC, add the `.toc_sidecar` class to the `toc` element. For example:

```markdown
1. TOC
{:toc .toc_sidecar}
```

### Modal Popup

To add a modal popup for content, add the `.modal-popup` class to the element containing the content. For example:

```markdown
![Image](/assets/images/unsplash-image-1.jpg)
{: .modal-popup }
```

### AI Disclosure Notice

The theme includes an AI disclosure notice that can be shown at the bottom of a page. This supports transparent disclosure when generative AI tools are used in content creation.

To enable the notice for a page, add an `ai` block to the page front matter and set `used: true`:

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
    - ChatGPT
  human_reviewed: true
```

When enabled, the page displays:

- A disclosure that AI assistance was used.
- Optional detail on whether code was AI-generated.
- Optional list of AI roles and tools.
- A link to the site AI Use Statement (`/ai-use/`).

Available role keys are defined in `docs/_data/ai_roles.yml`.

An AI Use Statement page is included at `docs/ai-use.md`. A custom plugin also ensures `/ai-use/` is only published when at least one page includes an `ai` metadata block.

For a complete working example, see `docs/examples/ai-disclosure-notice.md`.
