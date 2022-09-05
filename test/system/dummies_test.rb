require "application_system_test_case"

class DummiesTest < ApplicationSystemTestCase
  setup do
    @dummy = dummies(:one)
  end

  test "visiting the index" do
    visit dummies_url
    assert_selector "h1", text: "Dummies"
  end

  test "should create dummy" do
    visit dummies_url
    click_on "New dummy"

    click_on "Create Dummy"

    assert_text "Dummy was successfully created"
    click_on "Back"
  end

  test "should update Dummy" do
    visit dummy_url(@dummy)
    click_on "Edit this dummy", match: :first

    click_on "Update Dummy"

    assert_text "Dummy was successfully updated"
    click_on "Back"
  end

  test "should destroy Dummy" do
    visit dummy_url(@dummy)
    click_on "Destroy this dummy", match: :first

    assert_text "Dummy was successfully destroyed"
  end
end
