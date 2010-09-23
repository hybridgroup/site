class Presentation < ActiveRecord::Base
  belongs_to :proposal

  has_many :presentation_speakers
  has_many :speakers, :through => :presentation_speakers

  def title
    self.proposal ? self.proposal.title : self.place_holder
  end

  def abstract
    self.proposal ? self.proposal.abstract : self.description
  end
end
