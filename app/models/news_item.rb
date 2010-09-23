class NewsItem < ActiveRecord::Base
  attr_accessible :headline, :body, :user_id, :display_date, :expire_date

  validates_presence_of :headline
  validates_presence_of :body
  validates_presence_of :user_id
  validates_presence_of :display_date
  validates_presence_of :expire_date

  belongs_to :user

  named_scope :display, 
              :conditions => [
                              'display_date <= ? and expire_date >= ?',
                              Date.today, 
                              Date.today],
              :order => 'display_date desc'

  after_create :notify_community_c
  after_update :notify_community_u

  private
  def notify_community_c
    notify_community "created"
  end

  def notify_community_u
    notify_community "updated"
  end

  def notify_community action
    self.user.activities.create!(
                                 :message => 
                                 "just #{action} a conference announcement, " + 
                                 "see <a href='/'>home page</a> " +
                                 "for more information"
                                 )
  end
end
