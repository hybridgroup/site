class User < ActiveRecord::Base
  attr_accessible :username, :time_zone, :email, :session_token, :admin,
    :password, :password_confirmation

  attr_accessor :password, :password_confirmation

  attr_accessor :signup

  validates_length_of :username, :within => 3..40
  validates_presence_of :username, :email, :time_zone
  validates_uniqueness_of :username, :email
  validates_confirmation_of :password

  has_many :votes

  has_many :news_items

  has_many :proposals

  has_many :reviewed_proposals,
           :class_name => 'Proposal'

  has_many :activities, 
           :order => 'created_at desc',
           :conditions => ['suppressed = ?', true]

  has_one :profile

  before_save :hash_and_salt_password, :if => :password

  after_create :notify_community, :welcome_email

  def self.authenticate username, password
    user = find(:first, :conditions => ['LOWER(username) = LOWER(?)', username])
    if user && user.password?(password)
      user.last_login_date = Time.zone.now
      user.save
      user.activities.create!(:message => 'logged in successfully') 
      user
    end
  end

  def self.signup params
    create({:signup => true}.merge(params))
  end

  def password? password
    password_hash == Larc::Crypto.digest(password_salt, password)
  end

  def password_reset password
    self.password = password
    save
    UserMailer.deliver_reset_email self, password
  end

  def hash_and_salt_password
    unless self.password.empty?
      self.password_salt ||= Larc::Crypto.salt(username)
      self.password_hash   = Larc::Crypto.digest(password_salt, password)
    end
  end

  def forget!
    update_attribute :session_token, nil
    self.activities.create!(:message => 'logged out')
  end

  def remember!
    update_attribute :session_token, Larc::Crypto.salt(id)
    session_token
  end

  def dashboard?
    self.admin
  end

  def notify_community
    a = Activity.new
    a.user = self
    a.message = "created an account and joined the community"
    a.save
    self.last_login_date = Time.zone.now
    self.save
  end

  def welcome_email
    UserMailer.deliver_welcome_email(self)
  end

  def display_name
    if self.profile
      profile.full_name
    else
      self.username
    end
  end
end
