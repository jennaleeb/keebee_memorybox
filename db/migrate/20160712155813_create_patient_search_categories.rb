class CreatePatientSearchCategories < ActiveRecord::Migration
  def change
    create_table :patient_search_categories do |t|
      t.string :keyword
      t.references :advanced_patient_search, index: true

      t.timestamps null: false
    end
    add_foreign_key :patient_search_categories, :advanced_patient_searches
  end
end
