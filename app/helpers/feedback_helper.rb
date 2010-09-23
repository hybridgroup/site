module FeedbackHelper
  def from_internet_explorer?(request)
    request.env['HTTP_USER_AGENT'] =~ /MSIE/
  end

  def feedback_prompt feedback
    "Please provide your feedback:"
  end
end
