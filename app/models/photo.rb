require 'fileutils'

class Photo < ActiveRecord::Base
	belongs_to :patient
	has_attached_file :image,
	                  :styles => {
	                        :thumb => "100x100#",
	                        :small  => "150x150>",
	                        :medium => "200x200" }
	                        
	validates_attachment :image, presence: true,
	                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }

	def copy_file_to_patient_directory

		patient = Patient.find(self.patient_id)
		if self.id < 10
			path = Dir["#{Rails.root}/Images/photos/images/000/000/00#{self.id}/original/*"]
		else
			path = Dir["#{Rails.root}/Images/photos/images/000/000/0#{self.id}/original/*"]
		end
		FileUtils.cp(path, "Profiles/#{patient.first_name}/Pictures")

	end
end
