class ModifyUsersChangeColumnTypeLastLoginDate < ActiveRecord::Migration
  def self.up
    change_column :users, :last_login_date, :datetime
  end

  def self.down
    change_column :users, :last_login_date, :string
  end
end
