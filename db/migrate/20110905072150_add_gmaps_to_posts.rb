class AddGmapsToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :gmaps, :bool
  end

  def self.down
    remove_column :posts, :gmaps
  end
end
