class ModifySpeakersAddColumnsForPhoto < ActiveRecord::Migration
  def self.up
    add_column :speakers, :photo_file_name, :string
    add_column :speakers, :photo_content_type, :string
    add_column :speakers, :photo_file_size, :integer
  end

  def self.down
    remove_column :speakers, :photo_file_name
    remove_column :speakers, :photo_content_type
    remove_column :spakers, :photo_file_size
  end
end
