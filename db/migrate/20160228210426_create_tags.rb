class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.references :photo, index: true

      t.timestamps null: false
    end
    add_foreign_key :tags, :photos
  end
end
