class AddFavouriteMusicToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :favourite_music, :string
  end
end
