class CreatePhotos < ActiveRecord::Migration
  def self.up
    create_table :photos do |t|
      t.string :name
      t.string :relative_path
      t.string :absolute_path

      t.timestamps
    end
  end

  def self.down
    drop_table :photos
  end
end
