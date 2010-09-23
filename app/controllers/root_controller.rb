class RootController < ApplicationController
  def index
    @news_items = NewsItem.display.find(
                            :all,
                            :order => 'display_date desc, expire_date desc'
                                        )
  end

  def community
    unless session.user 
      redirect_to proposals_path()
    else
      require_user

      if session.user
        @activities = Activity.find(:all, :order => 'updated_at desc')
      end
    end
  end

  def contact_us
  end

  def venue
  end

  def sponsors
  end

  def thank_you
  end

  def members
    @members = User.find(:all,
                         :order => 'username')
  end
end
