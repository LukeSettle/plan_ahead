class Event < ApplicationRecord
  extend Enumerize

  belongs_to :plan

  enumerize :kind, in: [:travel, :activity]

  validate :starts_before_ends

  def total_time
    ends_at - starts_at
  end

  protected
    def starts_before_ends
      errors.add(:starts_at, I18n.t('model.event.errors.starts_before_ends')) if starts_at > ends_at
    end
end
