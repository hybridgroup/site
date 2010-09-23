require 'test_helper'

class UserTest < ActiveSupport::TestCase
  fixtures :users

  model_template_for User do
    {
      :username => "tester",
      :email => 'test@test.host',
      :password => '123456',
      :time_zone => 'Pacific Time (US & Canada)'
    }
  end

  test_validations_for :username, :uniqueness
  test_validations_for :email, :uniqueness
  test_validations_for :username, :presence
  test_validations_for :time_zone, :presence

  def test_create
    u = User.new
    u.username = "tester"
    u.email = "test@test.host"
    u.password = "123456"
    u.time_zone = "Pacific Time (US & Canada)"

    assert u.save
    assert_not_equal nil, u.password_hash
    assert_not_equal nil, u.password_salt
  end

  # TODO: Add tests to deal with password and password_confirmation

  def test_remember_and_forget
    u = users(:default)
    u.remember!

    assert_not_equal nil, u.session_token

    u.forget!

    assert_equal nil, u.session_token
  end

  def test_password_hashing_on_save
    u = new_user

    assert_not_nil u.password
    assert_nil u.password_hash
    assert_nil u.password_salt

    assert u.save!

    assert_not_nil u.password_hash
    assert_not_nil u.password_salt
  end

  def test_password_does_not_change_when_no_password
    u = create_user :password => "123456"
    assert u.password?("123456"), "password is hashed correctly"

    u = User.find(u.id)
    u.username = "test password hash"

    assert u.save!

    assert u.password?("123456"), "password is still hashed correctly."
  end

  def test_password_reset
    u = create_user :password => "123456"
    assert u.password?("123456"), "password set correctly"

    u.password_reset "456789"

    u = User.find(u.id)
    assert u.password?("456789"), "password was reset"
  end

  def test_last_login_date
    u = create_user :password => "123456"

    u.save!

    assert_not_nil u.last_login_date

    assert u = User.authenticate(u.username, "123456")

    assert_not_nil u.last_login_date

  end
end
