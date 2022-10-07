module ErrorReady
  class Problem < ApplicationRecord

    has_many :notices, foreign_key: "error_ready_problem_id"

    attribute :first_notice_at, :datetime, default: Time.current
    attribute :last_notice_at, :datetime, default: Time.current
    attribute :notices_count, :integer, default: 0

    scope :resolved, -> { where.not(resolved_at: nil) }
    scope :unresolved,  -> { where(resolved_at: nil) }
    scope :latest_first, -> { order(last_notice_at: :desc)}

  end
end
