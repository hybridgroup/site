class CreateProposalComments < ActiveRecord::Migration
  def self.up
    create_table :proposal_comments do |t|
      t.integer :proposal_id
      t.integer :left_by_user_id
      t.string :message

      t.timestamps
    end
  end

  def self.down
    drop_table :proposal_comments
  end
end
