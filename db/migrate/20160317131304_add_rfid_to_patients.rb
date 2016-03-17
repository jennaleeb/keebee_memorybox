class AddRfidToPatients < ActiveRecord::Migration
  def change
    add_column :patients, :RFID, :string
    Patient.reset_column_information
    Patient.all.each do |patient|
        patient.update_attributes!(:RFID => "0123456789")
    end
  end
end
