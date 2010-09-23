require 'test_helper'

class RootControllerTest < ActionController::TestCase
  def test_index
    get :index

    assert_response :success
  end

  def test_community_rejected_if_not_logged_in
    get :community

    assert_response 302
    assert_redirected_to proposals_path
  end

  # TODO: Add test and support to login user and verify page renders

  def test_contact_us
    get :contact_us

    assert_response :success
  end
end
