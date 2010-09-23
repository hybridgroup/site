class Speaker < ActiveRecord::Base
  attr_accessible :bio, :profile, :photo, :profile_id

  belongs_to :profile

  has_many :presentation_speakers
  has_many :presentations, :through => :presentation_speakers

  has_attached_file :photo, :styles => {
    :large => '300x300>',
    :medium => '200x200>',
    :thumb => '100x100#',
    :icon => '80x80>',
    :tiny => '50x50>'}

  validates_presence_of :bio, :photo

  def speaker_photo
    unless self.photo_file_name.nil?
      self.photo
    else
      self.profile.avatar
    end
  end

end
