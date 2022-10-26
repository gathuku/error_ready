require "test_helper"

module ErrorReady
  class ProblemTest < ActiveSupport::TestCase
    test "valid fixtures" do
      assert error_ready_problems.all?(&:valid?)
    end
  end
end
