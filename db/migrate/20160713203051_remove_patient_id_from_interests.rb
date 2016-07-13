class RemovePatientIdFromInterests < ActiveRecord::Migration
  def change
  	remove_column :interests, :patient_id
  end
end
