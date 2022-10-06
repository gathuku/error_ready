module ErrorReady
  class Notice < ApplicationRecord
    belongs_to :problem, foreign_key: "error_ready_problem_id"
  end
end
