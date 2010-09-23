class CreatePresentationSpeakers < ActiveRecord::Migration
  def self.up
    create_table :presentation_speakers do |t|
      t.integer :speaker_id, :null => false
      t.integer :presentation_id, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :presentation_speakers
  end
end
