class Feedback < ActiveRecord::Base
  attr_accessible :body, :email, :name, :title, :reviewed_by_user_id,
                  :reviewed_at

  validates_presence_of :body, :email

  named_scope :unreviewed, :conditions => {:reviewed_at => nil}

  belongs_to(:reviewed_by,
             :class_name => "User",
             :foreign_key => :reviewed_by_user_id)

  belongs_to :user

  def application
    "larubyconf2010"
  end

  def review! user
    self.reviewed_at = Time.zone.now
    self.reviewed_by = user
    self.save
  end

  def reviewed?
    reviewed_at.nil? == false
  end

  private

  def self.search string
    query, query_args, order_by =
      if string =~ /@/ then
        ['email like ?',
         ["%#{string}%"],
         'email']
      elsif string == ":reviewed?"
        ['reviewed_at is not null',
         [],
         'reviewed_at']
      elsif string == ":all"
        ['',
         [],
         'created_at']
      elsif string == ":default"
        ['reviewed_at is null',
         [],
         'created_at']
      else
        ['(title like ? or body like ?)',
         ["%#{string}%"] * 2,
         'title, body']
      end

    Feedback.find(:all,
                  :conditions => ["#{query}", *query_args],
                  :order => order_by)
  end
end
