class ModifyProposalsAddColumnRemoved < ActiveRecord::Migration
  def self.up
    add_column :proposals, :removed, :boolean, :default => false
  end

  def self.down
    remove_column :proposals, :removed
  end
end
