class AddDetailsToPatient < ActiveRecord::Migration
  def change
    add_column :patients, :nickname, :string
    add_column :patients, :language, :string
    add_column :patients, :birthplace, :string
    add_column :patients, :home_base, :string
    add_column :patients, :spouse_name, :string
    add_column :patients, :children, :string
    add_column :patients, :grandchildren, :string
    add_column :patients, :occupation, :string
    add_column :patients, :pets, :string
    add_column :patients, :favourite_sports, :string
    add_column :patients, :favourite_radio, :string
    add_column :patients, :favourite_childhood_games, :string
    add_column :patients, :favourite_movie_tv, :string
    add_column :patients, :favourite_actors, :string
    add_column :patients, :favourite_animals, :string
    add_column :patients, :additional_info, :text
  end
end
