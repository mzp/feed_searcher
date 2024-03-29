class FeedSearcher
  class Page
    attr_reader :page

    def initialize(page)
      @page = page
    end

    def feed_urls
      feed_attributes.map {|attribute| attribute["href"] }
    end

    private

    def feed_attributes
      root.xpath("//link[@type='application/rss+xml' or @type='application/atom+xml']")
    end

    def root
      Nokogiri.HTML(page.body)
    end
  end
end
