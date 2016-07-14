class InterestCategory < ActiveRecord::Base
	has_many :interests
	validates_uniqueness_of :name

	# Is this better as a method or a dictionary?
	def self.return_cat_id(name)
		cat = InterestCategory.find_by(name: name)
		return cat.id
	end

	@@examples = {
		"Favourite Music" => "E.g. Classical, jazz",
		"Favourite Sports" => "E.g. Soccer, baseball, bowling",
		"Favourite Radio" => "E.g. CBC, Car Talk'",
		"Favourite TV/Movies" => "E.g. Hey Lucy, Leave it to Beaver",
		"Favourite Childhood Games" => "E.g. Checkers, Hopscotch",
		"Favourite Actors" => "E.g. Andy Griffith, Judy Garland, Betty Davis",
		"Favourite Activities/Hobbies" => "E.g. Knitting, gardening, fishing",
		"Favourite Animals" => "E.g. Dogs, cats"
	}

	def self.examples
		@@examples
	end
end
