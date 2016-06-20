require 'fileutils'

class Patient < ActiveRecord::Base

	include ActiveModel::Dirty

	belongs_to :user
	has_many :photos, dependent: :destroy
	has_many :songs, dependent: :destroy
	has_many :videos, dependent: :destroy

	accepts_nested_attributes_for :songs

	# Take semi-colon separated string and turn it into a list
	def split_list(attribute)
		unless attribute.nil?
			list = attribute.split(",")
		end
		return list
	end


	# Create local folder for patient images
	def create_directory
		dirname = "Profiles/#{self.first_name}/Pictures"
		FileUtils.mkdir_p dirname
	end

	def self.search(search)
		# If searching by RFID, look for exact number, otherwise fuzzy. 
		if search.to_i > 0
			where("rfid_number = ?", search)
		else
	  		where('first_name ILIKE ? OR last_name ILIKE ?', "%#{search}%", "%#{search}%")
	  	end
	end
end
