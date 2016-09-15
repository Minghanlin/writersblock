require 'test_helper'

class MeaningsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get meanings_index_url
    assert_response :success
  end

end
