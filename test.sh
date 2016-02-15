rails c

Photo.all.each do |photo|
	photo.copy_file_to_patient_directory
end