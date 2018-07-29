require 'nokogiri'
require 'open-uri'

class WebPageSearch
  COMMON_SITE_NAMES = %w[airbnb tripadvisor].freeze
  EVENT_ATTRIBUTES = %w[title]

  def initialize(url)
    return nil unless url
    @url = url
    @site = check_for_common_site(url)
    $selenium_driver.navigate.to url
  end

  def search_for_attributes
    event_hash = {}
    EVENT_ATTRIBUTES.map do |attribute|
      value = if @site
                "#{attribute.capitalize}Finder".constantize.send("find_#{attribute}_on_#{@site}")
              else
                "#{attribute.capitalize}Finder".constantize.send("find_#{attribute}_on_default")
              end
      event_hash.merge!(attribute => value)
    end
  end

  protected
    def check_for_common_site(url)
      uri = URI.parse(url)
      site_name = uri.host.split('.').second
      return site_name if COMMON_SITE_NAMES.include? site_name
      nil
    end
end