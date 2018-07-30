require 'nokogiri'
require 'open-uri'

class WebPageSearch
  COMMON_SITE_NAMES = %w[airbnb tripadvisor expedia].freeze
  EVENT_ATTRIBUTES = %w[title price starts_at ends_at]

  def initialize(url)
    return nil unless url
    @uri = URI.parse(url)
    @site = check_for_common_site
    $selenium_driver.navigate.to url
  end

  def search_for_attributes
    event_hash = {}
    EVENT_ATTRIBUTES.each do |attribute|
      value = if @site
                "#{attribute.camelize}Finder".constantize.send("find_#{attribute}_on_#{@site}")
              else
                "#{attribute.camelize}Finder".constantize.send("find_#{attribute}_on_default")
              end
      event_hash.merge!(attribute => value) unless value.blank?
    end
    event_hash
  end

  protected
    def check_for_common_site
      site_name = @uri.host.split('.').second
      return site_name if COMMON_SITE_NAMES.include? site_name
      nil
    end
end