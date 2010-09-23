class CreateSponsors < ActiveRecord::Migration
  def self.up
    create_table :sponsors do |t|
      t.string :company_name
      t.string :sponsor_level
      t.date :sponsor_date
      t.timestamps
    end
  end

  def self.down
    drop_table :sponsors
  end
end
