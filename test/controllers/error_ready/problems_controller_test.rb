require "test_helper"

module ErrorReady
  class ProblemsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @problem = error_ready_problems(:one)
    end

    test "should get index" do
      get problems_url
      assert_response :success
    end


    test "should show problem" do
      get problem_url(@problem)
      assert_response :success
    end
  end
end
