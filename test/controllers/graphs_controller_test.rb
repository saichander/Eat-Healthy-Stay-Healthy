require 'test_helper'

class GraphsControllerTest < ActionController::TestCase
  test "should get graph" do
    get :graph
    assert_response :success
  end

end
