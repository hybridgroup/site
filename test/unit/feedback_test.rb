require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  fixtures :feedbacks, :users

  model_template_for Feedback do
    {
      :body    => 'Here is some feedback.',
      :email   => 'default@example.org'
    }
  end

  test_validations_for :body

  def test_application_value
    feedback = create_feedback 

    assert_equal "larubyconf2010", feedback.application
  end
end
