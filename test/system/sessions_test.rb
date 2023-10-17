require "application_system_test_case"

class SessionsTest < ApplicationSystemTestCase
  setup do
    @session = sessions(:first) # Reference to the first fixture session
  end

  test "Creating a new session" do
    # When we visit the Sessions#index page
    # we expect to see a title with the text "Sessions"
    visit sessions_path
    assert_selector "h1", text: "Sessions"

    # When we click on the link with the text "New session"
    # we expect to land on a page with the title "New session"
    click_on "New session"
    assert_selector "h1", text: "New session"

    # When we fill in the name input with "Capybara session"
    # and we click on "Create Session"
    fill_in "Name", with: "Capybara session"
    click_on "Create session"

    # We expect to be back on the page with the title "Sessions"
    # and to see our "Capybara session" added to the list
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
    assert_selector "h1", text: "Edit session"

    fill_in "Name", with: "Updated session"
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
