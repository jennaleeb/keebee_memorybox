require 'fileutils'

class Patient < ActiveRecord::Base

	include ActiveModel::Dirty
	include Filterable

	belongs_to :user
	has_many :patient_interests
	has_many :interests, through: :patient_interests
	has_many :photos, dependent: :destroy
	has_many :songs, dependent: :destroy
	has_many :videos, dependent: :destroy

	accepts_nested_attributes_for :songs, allow_destroy: true
	accepts_nested_attributes_for :interests, :reject_if => lambda { |b| b[:name].blank? }

	scope :residence, -> (residence) {where("residence ILIKE ?", "#{residence}")}

	# For experimenting with tests, not implemented
	def describe
		return "#{self.first_name} #{self.last_name}"
	end

	# Take model's comma separated string and turn it into a list
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

	def self.tag_search(tag_name)
		tags = Tag.where(name: tag_name)
		patients = []
		tags.each do |tag|
			photo = Photo.find(tag.photo_id)
			patients << Patient.find(photo.patient_id)
		end

		return patients

	end

	def self.patients_recent_update
		updated_interests = PatientInterest.all.where("created_at > ?", 1.day.ago.utc).collect {|p| Patient.find(p.patient_id)}.uniq
		updated_profiles = Patient.where("updated_at > ?", 1.day.ago.utc)
		return (updated_interests + updated_profiles).uniq
	end

end
