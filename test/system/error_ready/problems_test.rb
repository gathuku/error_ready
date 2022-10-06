require "application_system_test_case"

module ErrorReady
  class ProblemsTest < ApplicationSystemTestCase
    setup do
      @problem = error_ready_problems(:one)
    end

    test "visiting the index" do
      visit problems_url
      assert_selector "h1", text: "Problems"
    end

    test "should create problem" do
      visit problems_url
      click_on "New problem"

      fill_in "Environment", with: @problem.environment
      fill_in "Err class", with: @problem.err_class
      fill_in "First notice at", with: @problem.first_notice_at
      fill_in "Last notice at", with: @problem.last_notice_at
      fill_in "Message", with: @problem.message
      fill_in "Notices count", with: @problem.notices_count
      fill_in "Resolved at", with: @problem.resolved_at
      click_on "Create Problem"

      assert_text "Problem was successfully created"
      click_on "Back"
    end

    test "should update Problem" do
      visit problem_url(@problem)
      click_on "Edit this problem", match: :first

      fill_in "Environment", with: @problem.environment
      fill_in "Err class", with: @problem.err_class
      fill_in "First notice at", with: @problem.first_notice_at
      fill_in "Last notice at", with: @problem.last_notice_at
      fill_in "Message", with: @problem.message
      fill_in "Notices count", with: @problem.notices_count
      fill_in "Resolved at", with: @problem.resolved_at
      click_on "Update Problem"

      assert_text "Problem was successfully updated"
      click_on "Back"
    end

    test "should destroy Problem" do
      visit problem_url(@problem)
      click_on "Destroy this problem", match: :first

      assert_text "Problem was successfully destroyed"
    end
  end
end
