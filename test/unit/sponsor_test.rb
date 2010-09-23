require 'test_helper'

class SponsorTest < ActiveSupport::TestCase

  model_template_for Sponsor do
    {
      :company_name => "Template Sponsor",
      :sponsor_level => "Ruby"
    }
  end

  test_validations_for :company_name, :presence
  test_validations_for :sponsor_level, :presence

  def test_create
    s = Sponsor.new
    s.company_name = "Test Sponsor"
    s.sponsor_level = "Gold"

    assert s.save
  end
end
