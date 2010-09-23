require 'test_helper'

class Admin::PresentationsControllerTest < ActionController::TestCase
  def test_index
    get :index

    assert_response :success
  end
end
