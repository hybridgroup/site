class ModifyProposalsAddColumnStatus < ActiveRecord::Migration
  def self.up
    add_column :proposals, :status, :string
    remove_column :proposals, :status_id
  end

  def self.down
    remove_column :proposals, :status
    add_column :proposals, :status_id, :integer
  end
end
