class CreateNewsItems < ActiveRecord::Migration
  def self.up
    create_table :news_items do |t|
      t.string :headline, :limit => 300
      t.string :body, :limit => 4096
      t.integer :user_id
      t.datetime :display_date
      t.datetime :expire_date
      t.timestamps
    end
  end

  def self.down
    drop_table :news_items
  end
end
