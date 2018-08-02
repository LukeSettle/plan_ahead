class ParentEvent < ApplicationRecord
  extend Enumerize

  # before_validation :search_for_fields

  belongs_to :plan

  has_many :travel_events

  enumerize :kind, in: [:travel, :activity, :lodging]
  enumerize :currency, in: [:us_dollar, :euro, :pound], default: :us_dollar

  validates :kind, presence: true

  def total_time
    1
  end

  protected
    def starts_before_ends
      return unless starts_at.present? && ends_at.present?
      errors.add(:base, I18n.t('model.parent_event.errors.starts_before_ends')) if starts_at > ends_at
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
