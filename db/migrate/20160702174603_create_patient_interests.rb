class CreatePatientInterests < ActiveRecord::Migration
  def change
    create_table :patient_interests do |t|
      t.references :patient, index: true
      t.references :interest, index: true

      t.timestamps null: false
    end
    add_foreign_key :patient_interests, :patients
    add_foreign_key :patient_interests, :interests
  end
end
