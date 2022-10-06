module ErrorReady
  class Problem < ApplicationRecord

    attribute :first_notice_at, :datetime, default: Time.current
    attribute :last_notice_at, :datetime, default: Time.current
    attribute :notices_count, :integer, default: 0

    scope :resolved, -> { where.not(resolved_at: nil) }
    scope :unresolved,  -> { where(resolved_at: nil) }

  end
end
