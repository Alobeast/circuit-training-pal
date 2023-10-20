require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  setup do
    @session = Session.ordered.first # Reference to the first fixture session
  end

  test "Creating a new session" do
    visit sessions_path
    assert_selector "h1", text: "Sessions"

    click_on "New session"
    fill_in "Name", with: "Capybara session"

    assert_selector "h1", text: "Sessions"
    click_on "Create session"

    assert_selector "h1", text: "Sessions"
    assert_text "Capybara session"
  end

  test "Showing a session" do
    visit sessions_path
    click_link @session.name

    assert_selector "h1", text: @session.name
  end

  test "Updating a session" do
    visit sessions_path
    assert_selector "h1", text: "Sessions"

    click_on "Edit", match: :first
    fill_in "Name", with: "Updated session"

    assert_selector "h1", text: "Sessions"
    click_on "Update session"

    assert_selector "h1", text: "Sessions"
    assert_text "Updated session"
  end

  test "Destroying a session" do
    visit sessions_path
    assert_text @session.name

    click_on "Delete", match: :first
    assert_no_text @session.name
  end
end
