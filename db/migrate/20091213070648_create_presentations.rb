class CreatePresentations < ActiveRecord::Migration
  def self.up
    create_table :presentations do |t|
      t.datetime :presentation_date_time
      t.integer :proposal_id
      t.string :place_holder
      t.string :room

      t.timestamps
    end
  end

  def self.down
    drop_table :presentations
  end
end
