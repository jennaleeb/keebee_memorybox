class Patient < ActiveRecord::Base
	has_many :photos

	# Take semi-colon separated string and turn it into a list
	def split_list(attribute)
		list = attribute.split(",")
		return list
	end
end
