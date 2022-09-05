require "test_helper"

class FlipbooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flipbook = flipbooks(:one)
  end

  test "should get index" do
    get flipbooks_url
    assert_response :success
  end

  test "should get new" do
    get new_flipbook_url
    assert_response :success
  end

  test "should create flipbook" do
    assert_difference("Flipbook.count") do
      post flipbooks_url, params: { flipbook: { description: @flipbook.description, subtitle: @flipbook.subtitle, thumbnail: @flipbook.thumbnail, title: @flipbook.title, url: @flipbook.url } }
    end

    assert_redirected_to flipbook_url(Flipbook.last)
  end

  test "should show flipbook" do
    get flipbook_url(@flipbook)
    assert_response :success
  end

  test "should get edit" do
    get edit_flipbook_url(@flipbook)
    assert_response :success
  end

  test "should update flipbook" do
    patch flipbook_url(@flipbook), params: { flipbook: { description: @flipbook.description, subtitle: @flipbook.subtitle, thumbnail: @flipbook.thumbnail, title: @flipbook.title, url: @flipbook.url } }
    assert_redirected_to flipbook_url(@flipbook)
  end

  test "should destroy flipbook" do
    assert_difference("Flipbook.count", -1) do
      delete flipbook_url(@flipbook)
    end

    assert_redirected_to flipbooks_url
  end
end
