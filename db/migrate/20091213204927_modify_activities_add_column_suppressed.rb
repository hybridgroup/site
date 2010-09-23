class ModifyActivitiesAddColumnSuppressed < ActiveRecord::Migration
  def self.up
    add_column :activities, :suppressed, :boolean, :default => false
  end

  def self.down
    remove_column :activities, :suppressed
  end
end
