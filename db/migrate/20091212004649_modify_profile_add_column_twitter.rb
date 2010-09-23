class ModifyProfileAddColumnTwitter < ActiveRecord::Migration
  def self.up
    add_column :profiles, :twitter_account, :string
  end

  def self.down
    remove_column :profiles, :twitter_account
  end
end
