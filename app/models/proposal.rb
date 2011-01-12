class Proposal < ActiveRecord::Base
  belongs_to :user

  belongs_to :revewed_by,
             :class_name => 'User',
             :foreign_key => 'reviewed_by_user_id'


  has_one :presentation

  has_many :votes

  has_many :comments, :class_name => "ProposalComment"

  validates_presence_of :title
  validates_presence_of :abstract
  validates_presence_of :user

  before_create :set_date

  default_scope :conditions => ['removed = ?', false]

  after_save :notify_community

  STATUSES = ['Pending','Accepted','Rejected']

  def self.find_with_destroyed *args
    self.with_exclusive_scope { find(*args) }
  end

  def tiny_abstract
    # TODO: make tiny_abstract intelligent, so it doesn't disgard
    #       new line characters
    if abstract.length > 400
      length = 100
      end_string = "..."
      words = abstract.split
      words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
    else
      abstract
    end
  end

  def submitted_at
    # TODO: Remove this method after updating migration
    date_submitted
  end

  def remove
    self.removed = true
  end

  def remove!
    self.removed = true
    self.save
  end

  def notify_community
    self.user.activities.create!(
       :message => "updated their proposal - #{self.title}")
  end

  def liked_by? user
    self.votes.map { |v| v.user }.include?(user)
  end

  private
  def set_date
    self.date_submitted = Time.zone.now
    self.status = STATUSES[0]
  end

end
