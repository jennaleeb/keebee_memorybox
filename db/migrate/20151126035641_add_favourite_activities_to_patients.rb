class AddFavouriteActivitiesToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :favourite_activities, :string
  end
end
