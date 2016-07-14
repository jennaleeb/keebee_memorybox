# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
@residences = ['Grandview Lodge', 'Pine Springs', 'Fairview', 'Heritage Home']

10.times do

	Patient.create(
		first_name: Faker::Name.first_name,
		last_name: Faker::Name.last_name,
		birthplace: Faker::Address.country,
		home_base: Faker::Address.city,
		spouse_name: Faker::Name.name,
		residence: @residences.shuffle.sample
		rfid_number: "123456789012".split('').shuffle.join
	)

end

categories = InterestCategory.create([{name: "Favourite Music"},
								{name: "Favourite Sports"},
								{name: "Favourite Radio"},
								{name: "Favourite TV/Movies"},
								{name: "Favourite Childhood Games"},
								{name: "Favourite Actors"},
								{name: "Favourite Activities/Hobbies"},
								{name: "Favourite Animals"}])

interests = Interest.create([{name: "Classical", category_id: 1},
							{name: "Jazz", category_id: 1},
							{name: "Rock", category_id: 1},
							{name: "Baseball", category_id: 2},
							{name: "Soccer", category_id: 2},
							{name: "Leave it to Beaver", category_id: 3},
							{name: "Hey Lucy", category_id: 3},
							{name: "Checkers", category_id: 4},
							{name: "Scrabble", category_id: 4},
							{name: "Hopscotch", category_id: 4},
							{name: "Betty Davis", category_id: 5},
							{name: "Chevy Chase", category_id: 5},
							{name: "Knitting", category_id: 6},
							{name: "Reading", category_id: 6},
							{name: "Fishing", category_id: 6},
							{name: "Cats", category_id: 7},
							{name: "Dogs", category_id: 7}])

Patient.all.each do |patient|
	5.times do 
		PatientInterest.create(patient_id: patient.id, interest_id: rand(1..Interest.all.count))
	end
end