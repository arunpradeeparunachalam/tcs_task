require "application_system_test_case"

class OrangesTest < ApplicationSystemTestCase
  setup do
    @orange = oranges(:one)
  end

  test "visiting the index" do
    visit oranges_url
    assert_selector "h1", text: "Oranges"
  end

  test "creating a Orange" do
    visit oranges_url
    click_on "New Orange"

    click_on "Create Orange"

    assert_text "Orange was successfully created"
    click_on "Back"
  end

  test "updating a Orange" do
    visit oranges_url
    click_on "Edit", match: :first

    click_on "Update Orange"

    assert_text "Orange was successfully updated"
    click_on "Back"
  end

  test "destroying a Orange" do
    visit oranges_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Orange was successfully destroyed"
  end
end
