# only publish ai-use page if there is metadata with ai key in any document
# (excluding ai-use page itself)

# frozen_string_literal: true

module ConditionalAiUsePage
  class Generator < Jekyll::Generator
    priority :lowest
    safe true

    AI_USE_URL = '/ai-use/'
    AI_USE_PATH = 'ai-use.md'

    def generate(site)
      # check if any document has ai metadata key (excluding ai-use page)
      all_items = site.pages + site.collections.values.flat_map(&:docs)
      
      has_ai_metadata = all_items.any? do |doc|
        next false if doc.url == AI_USE_URL
        next false unless doc.data.is_a?(Hash)
        next false unless doc.data.fetch('published', true)
        
        doc.data.key?('ai')
      end

      # get ai-use page if it exists
      ai_use_page = site.pages.find { |page| page.url == AI_USE_URL }

      # if ai-use page exists but no documents have ai metadata, remove the page
      if ai_use_page && !has_ai_metadata
        site.pages.delete(ai_use_page)
      end

      # if ai-use page doesn't exist but there are documents with ai metadata, create the page
      if !ai_use_page && has_ai_metadata
        new_page = Jekyll::PageWithoutAFile.new(site, site.source, '', AI_USE_PATH)
        new_page.data['layout'] = 'default'
        new_page.data['title'] = 'AI Use'
        new_page.data['permalink'] = AI_USE_URL
        site.pages << new_page
      end

    end
  end
end