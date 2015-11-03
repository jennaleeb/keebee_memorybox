class AddPhotoIdToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :photo_id, :integer
  end
end
