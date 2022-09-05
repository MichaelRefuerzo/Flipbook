require "application_system_test_case"

class FlipbooksTest < ApplicationSystemTestCase
  setup do
    @flipbook = flipbooks(:one)
  end

  test "visiting the index" do
    visit flipbooks_url
    assert_selector "h1", text: "Flipbooks"
  end

  test "should create flipbook" do
    visit flipbooks_url
    click_on "New flipbook"

    fill_in "Description", with: @flipbook.description
    fill_in "Subtitle", with: @flipbook.subtitle
    fill_in "Thumbnail", with: @flipbook.thumbnail
    fill_in "Title", with: @flipbook.title
    fill_in "Url", with: @flipbook.url
    click_on "Create Flipbook"

    assert_text "Flipbook was successfully created"
    click_on "Back"
  end

  test "should update Flipbook" do
    visit flipbook_url(@flipbook)
    click_on "Edit this flipbook", match: :first

    fill_in "Description", with: @flipbook.description
    fill_in "Subtitle", with: @flipbook.subtitle
    fill_in "Thumbnail", with: @flipbook.thumbnail
    fill_in "Title", with: @flipbook.title
    fill_in "Url", with: @flipbook.url
    click_on "Update Flipbook"

    assert_text "Flipbook was successfully updated"
    click_on "Back"
  end

  test "should destroy Flipbook" do
    visit flipbook_url(@flipbook)
    click_on "Destroy this flipbook", match: :first

    assert_text "Flipbook was successfully destroyed"
  end
end
