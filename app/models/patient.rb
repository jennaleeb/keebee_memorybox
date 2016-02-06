class Patient < ActiveRecord::Base
	belongs_to :user
	has_many :patients
	has_many :photos, dependent: :destroy

	# Take semi-colon separated string and turn it into a list
	def split_list(attribute)
		list = attribute.split(",")
		return list
	end
end
