require 'test_helper'

class ProposalTest < ActiveSupport::TestCase
  fixtures :users, :proposals

  model_template_for Proposal do
    {
      :title => 'Test Presentation',
      :abstract => 'This is a test proposal submission abstract.',
      :user => users(:default)
    }
  end

  test_validations_for :title, :presence
  test_validations_for :abstract, :presence
  test_validations_for :user, :presence

end
