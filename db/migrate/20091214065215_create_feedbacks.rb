class CreateFeedbacks < ActiveRecord::Migration
  def self.up
    create_table :feedbacks do |t|
      t.integer :user_id
      t.integer :reviewed_by_user_id
      t.datetime :reviewed_at
      t.string :title,          :limit => 500
      t.string :body,           :limit => 4_000
      t.string :nature,         :limit => 500
      t.string :name,           :limit => 2_048
      t.string :email,          :limit => 2_048
      t.string :domain,         :limit => 256
      t.string :url,            :limit => 2_048
      t.string :referer,        :limit => 2_048
      t.string :application,    :limit => 256
      t.string :remote_ip,      :limit => 39   #IPv6
      t.string :user_agent,     :limit => 2_048
      t.string :cookies,        :limit => 2_048

      t.timestamps
    end
  end

  def self.down
    drop_table :feedbacks
  end
end
