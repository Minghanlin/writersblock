require 'test_helper'

class SynonymsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get synonyms_index_url
    assert_response :success
  end

end
