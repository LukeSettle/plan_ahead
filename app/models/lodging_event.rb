class LodgingEvent < ApplicationRecord
  extend Enumerize

  belongs_to :plan

  before_validation :search_for_fields

  enumerize :price_type, in: [:nightly, :weekly, :monthly]

  validates :title, :starts_at, :ends_at, :price, presence: true

  protected
    def search_for_fields
      return if link.present? && title.present?
      found_attributes = web_page_search.search_for_attributes
      assign_attributes(found_attributes)
    end

    def web_page_search
      @web_page_search ||= WebPageSearch.new(link)
    end
end
