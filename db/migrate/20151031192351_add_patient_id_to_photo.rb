class AddPatientIdToPhoto < ActiveRecord::Migration
  def change
    add_column :photos, :patient_id, :integer
  end
end
