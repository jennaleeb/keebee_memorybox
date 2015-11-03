class RemovePhotoIdFromPatients < ActiveRecord::Migration
  def change
    remove_column :patients, :photo_id, :integer
  end
end
