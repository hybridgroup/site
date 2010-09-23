require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  fixtures :users

  def setup
    super
    @controller = SessionsController.new
  end

  model_template_for User do
    {
      :username  => "template_user",
      :email     => "user@test.org",
      :time_zone => "Pacific Time (US & Canada)",
      :password  => "123456"
    }
  end

  def test_show
    get :show

    assert_redirected_to new_session_path
  end

end
