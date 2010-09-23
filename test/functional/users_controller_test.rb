require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  fixtures :users

  def setup
    super
    @default = users(:default)
  end

  def test_new
    get :new

    assert_response :success
    assert_not_nil assigns(:user)
    assert_not_nil "new"
    assert_select "form#new_user"
  end
end
