class ModifyUsersAddColumnSessionToken < ActiveRecord::Migration
  def self.up
    add_column :users, :session_token, :string
  end

  def self.down
    remove_column :users, :session_token
  end
end
