class RemoveMultipleColumnsFromPatient < ActiveRecord::Migration
  def change
  	remove_column :patients, :favourite_music
  	remove_column :patients, :favourite_sports
  	remove_column :patients, :favourite_radio
  	remove_column :patients, :favourite_childhood_games
  	remove_column :patients, :favourite_movie_tv
  	remove_column :patients, :favourite_actors
  	remove_column :patients, :favourite_animals
  	remove_column :patients, :favourite_activities
  end
end
