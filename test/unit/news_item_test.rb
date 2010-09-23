require 'test_helper'

class NewsItemTest < ActiveSupport::TestCase
  fixtures :users

  model_template_for NewsItem do
    {
      :headline => 'new new new',
      :body => 'check out our new new new stuff.',
      :user_id => users(:default).id,
      :display_date => '1/1/2009',
      :expire_date => '12/31/2009'
    }
  end

  test_validations_for :headline, :presence
  test_validations_for :body, :presence

  def test_create
    ni = create_news_item

    assert ni.save
  end
end
