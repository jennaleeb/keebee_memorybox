require 'fileutils'

class Patient < ActiveRecord::Base
	belongs_to :user
	# has_many :patients
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

	def create_directory
		dirname = "Profiles/#{self.first_name}/Pictures"
		FileUtils.mkdir_p dirname
	end
end
