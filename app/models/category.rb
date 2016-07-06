class Category < ActiveRecord::Base
	has_many :interests

	# Is this better as a method or a dictionary?
	def self.return_cat_id(name)
		cat = Category.find_by(name: name)
		return cat.id
	end
end
