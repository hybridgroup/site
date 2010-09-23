class CreateProposals < ActiveRecord::Migration
  def self.up
    create_table :proposals do |t|
      t.string :title
      t.text :abstract
      t.string :target_audience
      t.integer :code_weight
      t.datetime :date_submitted
      t.boolean :reviewed
      t.datetime :date_reviewed
      t.integer :reviewed_by_user_id
      t.integer :status_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :proposals
  end
end
