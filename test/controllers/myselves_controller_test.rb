require 'test_helper'

class MyselvesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get myselves_show_url
    assert_response :success
  end

end
