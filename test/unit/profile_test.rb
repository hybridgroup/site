require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
  fixtures :users, :profiles

  model_template_for Profile do
    {
      :first_name => "Coby",
      :last_name => "Randquist",
      :location => "Glendale, CA"
    }
  end

  test_validations_for :first_name, :presence
  test_validations_for :last_name, :presence

  def test_create
    p = Profile.new

    p.first_name = "John"
    p.last_name = "Doe"
    p.user = users(:default)

    assert p.save
  end
end
