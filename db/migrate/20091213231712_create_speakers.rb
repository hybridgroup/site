class CreateSpeakers < ActiveRecord::Migration
  def self.up
    create_table :speakers do |t|
      t.integer :profile_id
      t.text :bio

      t.timestamps
    end
  end

  def self.down
    drop_table :speakers
  end
end
