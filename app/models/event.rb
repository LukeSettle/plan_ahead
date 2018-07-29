class Event < ApplicationRecord
  extend Enumerize

  before_save :search_for_fields

  belongs_to :plan

  enumerize :kind, in: [:travel, :activity, :lodging]
  enumerize :currency, in: [:us_dollar, :euro, :pound], default: :us_dollar

  # validate :starts_before_ends

  def total_time
    # ends_at - starts_at
  end

  protected
    def starts_before_ends
      errors.add(:base, I18n.t('model.event.errors.starts_before_ends')) if starts_at > ends_at
    end

    def search_for_fields
      self.price = web_page_search.search_for_price
    end

    def web_page_search
      @web_page_search ||= WebPageSearch.new(link)
    end
end
