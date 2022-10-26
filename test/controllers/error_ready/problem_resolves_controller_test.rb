require "test_helper"

module ErrorReady
  class ProblemResolvesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @problem = error_ready_problems(:one)
    end

    test "#create" do
      freeze_time do
        assert_changes -> { @problem.reload.resolved_at }, to: Time.current do
          post problem_resolve_path(@problem)
        end
        assert_redirected_to problems_path
        assert_match(/Problem resolved/, flash[:notice])
      end
    end
  end
end
