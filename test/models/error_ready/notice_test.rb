require "test_helper"

module ErrorReady
  class NoticeTest < ActiveSupport::TestCase
    test "valid fixtures" do
      assert error_ready_notices.all?(&:valid?)
    end
  end
end
