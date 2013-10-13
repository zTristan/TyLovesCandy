require 'test_helper'

class InfoControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get how_to_play" do
    get :how_to_play
    assert_response :success
  end

end
