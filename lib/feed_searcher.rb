require "feed_searcher/version"
require "feed_searcher/fetcher"
require "feed_searcher/page"
require "mechanize"
require "nokogiri"

class FeedSearcher
  def self.search(*args)
    new(*args).search
  end

  attr_reader :options, :url

  def initialize(url, options = {})
    @url     = url
    @options = options
  end

  def search
    fetch.feed_urls
  end

  private

  def fetch
    Fetcher.fetch(url, options)
  end
end
