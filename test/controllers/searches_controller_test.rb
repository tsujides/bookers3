require "test_helper"

class SearchesControllerTest < ActionDispatch::IntegrationTest
  test "should get book" do
    get searches_book_url
    assert_response :success
  end

  test "should get user" do
    get searches_user_url
    assert_response :success
  end
end
