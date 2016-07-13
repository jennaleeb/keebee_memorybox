class CreateAdvancedPatientSearches < ActiveRecord::Migration
  def change
    create_table :advanced_patient_searches do |t|
      t.string :keywords
      t.integer :search_category_id

      t.timestamps null: false
    end
  end
end
