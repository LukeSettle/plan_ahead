class Event < ApplicationRecord
  extend Enumerize

  before_validation :search_for_fields

  belongs_to :plan

  enumerize :kind, in: [:travel, :activity, :lodging]
  enumerize :currency, in: [:us_dollar, :euro, :pound], default: :us_dollar

  validates :title, :starts_at, :ends_at, :price, :kind, presence: true
  validate :starts_before_ends

  def total_time
    ends_at - starts_at
  end

  protected
    def starts_before_ends
      return unless starts_at.present? && ends_at.present?
      errors.add(:base, I18n.t('model.event.errors.starts_before_ends')) if starts_at > ends_at
    end

    def search_for_fields
      return if link.present? && title.present?
      found_attributes = web_page_search.search_for_attributes
      assign_attributes(found_attributes)
    end

    def web_page_search
      @web_page_search ||= WebPageSearch.new(link)
    end
end
