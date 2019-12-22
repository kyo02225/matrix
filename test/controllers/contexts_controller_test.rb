require 'test_helper'

class ContextsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get contexts_index_url
    assert_response :success
  end

end
