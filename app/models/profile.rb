class Profile < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :gender, :tshirt_size,
  :meal_preference, :company_name, :title, :location, :user_id,
  :avatar, :twitter_account

  validates_presence_of :first_name, :last_name

  has_many :links

  has_attached_file :avatar, 
                    :styles => {
                            :large => '300x300>',
                            :medium => '200x200>', 
                            :thumb => '100x100>',
                            :icon => '80x80>',
                            :tiny => '50x50>'
                    },
                    :default_url => '/avatars/missing_:style.png'

  belongs_to :user

  has_one :speaker

  after_save :record_activity

  GENDERS = ['N/A','Male','Female']
  TSHIRT_SIZES = ['N/A','S','M','L','XL','2XL','3XL']
  MEAL_PREFERENCES = ['N/A','Any','Diabetic','Vegan','Vegetarian']

  def display_name
    "#{self.full_name} (#{self.user.username})"
  end

  def full_name
    [self.first_name, self.last_name].join(" ")
  end

  def percent_complete
    total_points = 55

    points = 0
    points +=5 unless first_name.blank?
    points +=5 unless last_name.blank?
    points +=5 unless gender == "N/A"
    points +=5 unless tshirt_size == "N/A"
    points +=5 unless meal_preference == "N/A"
    points +=5 unless company_name.blank?
    points +=5 unless title.blank?
    points +=5 unless location.blank?
    points +=5 unless user_id.blank?
    points +=5 unless avatar_file_name.blank?
    points +=5 unless twitter_account.blank?

    (points.to_f / total_points) * 100
  end

  def record_activity
    if self.user
      self.user.activities.create!(
                                   :message => "updated their profile, 
                                   now #{percent_complete.to_i}% complete")
    end
  end
end
