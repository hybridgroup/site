class ModifyPresentationsAddColumnDescription < ActiveRecord::Migration
  def self.up
    add_column :presentations, :description, :string, :default => ''
  end

  def self.down
    remove_column :presentations, :description
  end
end
