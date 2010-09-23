class ProposalComment < ActiveRecord::Base
  attr_accessible :proposal_id, :left_by_user_id, :message

  belongs_to :proposal
  belongs_to :left_by, :class_name => 'User', :foreign_key => 'left_by_user_id'

  validates_presence_of :message
  validates_length_of :message, :in => 5..2048

end
