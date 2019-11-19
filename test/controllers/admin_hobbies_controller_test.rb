require 'test_helper'

class AdminHobbiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_hobbies_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_hobbies_show_url
    assert_response :success
  end

end
