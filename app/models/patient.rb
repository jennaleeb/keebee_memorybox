class Patient < ActiveRecord::Base
	has_many :photos

	# Take semi-colon seperated string and turn it into a list
	def activity_deliniate
		return self.favourite_activities.split(",")
	end
end
