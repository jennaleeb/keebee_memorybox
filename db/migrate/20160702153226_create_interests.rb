class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :name
      t.string :category
      t.references :patient, index: true

      t.timestamps null: false
    end
    add_foreign_key :interests, :patients
    add_index :interests, :category

  end
end
