class ModifySponsorsAddColumnBlurb < ActiveRecord::Migration
  def self.up
    add_column :sponsors, :blurb, :text, :size => 4096
  end

  def self.down
    remove_column :sponsors, :blurb
  end
end
