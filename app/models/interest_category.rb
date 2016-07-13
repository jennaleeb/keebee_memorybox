class InterestCategory < ActiveRecord::Base
	has_many :interests
	validates_uniqueness_of :name

	# Is this better as a method or a dictionary?
	def self.return_cat_id(name)
		cat = InterestCategory.find_by(name: name)
		return cat.id
	end
end
