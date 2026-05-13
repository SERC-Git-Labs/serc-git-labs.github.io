# plugin that generates slides from markdown files using pandoc

require 'pandoc-ruby'

module GenerateSlides
  SLIDES_SUFFIX = '/slides'
  DEFAULTS = {
    'theme' => 'white',
    'controls' => 'true',
    'controlsTutorial' => 'true',
    'slideNumber' => 'false',
    'transition' => 'none'
  }

  class Generator < Jekyll::Generator
    priority :highest
    safe true

    def generate(site)
      site_config = site.config['slides'] || {}
      slide_config = DEFAULTS.merge(site_config)

      site.pages.each do |page|
        if page.data['slides']
          if page.data['slides'].is_a?(Hash)
            # merge page config with site config with defaults
            page_slide_config = slide_config.merge(page.data['slides'])
          else
            page_slide_config = slide_config
          end

          # create new slide page from markdown
          slide_config_string = page_slide_config.map { |k, v| "-V #{k}=#{v}" }.join(' ')
          slide_config_string += ' --mathjax'
          slide_config_string += ' --slide-level=1'
          slide_content = PandocRuby.convert(File.read(File.join(site.source, page.path)), :s, { f: :markdown, to: :revealjs }, slide_config_string)

          # add mermaid plugin: https://www.npmjs.com/package/reveal.js-mermaid-plugin
          # add plugin script
          plugin_version = '11.6.0'
          slide_content = slide_content.gsub('<!-- reveal.js plugins -->', "<!-- reveal.js plugins -->
  <script src=\"https://cdn.jsdelivr.net/npm/reveal.js-mermaid-plugin@#{plugin_version}/plugin/mermaid/mermaid.js\"></script>")
          # update reveal.js config
          slide_content = slide_content.gsub('// reveal.js plugins', '// mermaid config
        mermaid: {  },

        // reveal.js plugins')
          # add plugin
          slide_content = slide_content.gsub('plugins: [', 'plugins: [
          RevealMermaid,')

          # move mermaid class to code tag
          slide_content = slide_content.gsub('<pre class="mermaid"><code>', '<pre><code class="mermaid">')

          # base slide page url on original page url
          slide_page_url = page.url.gsub('.html', '') + SLIDES_SUFFIX + '.html'

          # create new slide page
          slide_page = Jekyll::PageWithoutAFile.new(site, site.source, File.dirname(slide_page_url), File.basename(slide_page_url))
          
          # slide_page.data = {
          #   'layout' => nil,
          #   'permalink' => slide_page_url,
          #   'nav_exclude' => true
          # }
          slide_page.content = slide_content

          site.pages << slide_page

          # embed slide page in original page
          page.data['slide_page_url'] = slide_page_url
          page.content = "{% include embed_slides.html title=page.title url=page.slide_page_url %}"

          # remove slides from original page
          page.data.delete('slides')
        end
      end 
    end
  end
end