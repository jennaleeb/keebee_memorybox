Patient.all.each do |patient|
	patient.create_directory
end

Photo.all.each do |photo|
	photo.copy_file_to_patient_directory
end