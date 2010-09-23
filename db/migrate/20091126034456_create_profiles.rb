class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :tshirt_size
      t.string :meal_preference
      t.string :company_name
      t.string :title
      t.string :location
      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
