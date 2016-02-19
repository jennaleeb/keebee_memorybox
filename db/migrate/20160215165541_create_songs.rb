class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.string :url
      t.references :patient, index: true

      t.timestamps null: false
    end
    add_foreign_key :songs, :patients
  end
end
