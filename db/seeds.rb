# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Patient.populate 10 do |patient|
	patient.first_name = Faker::Name.first_name
	patient.last_name = Faker::Name.last_name
	patient.birthplace = Faker::Address.country
	patient.home_base = Faker::Address.city
	patient.spouse_name = Faker::Name.name

	residences = ['Grandview Lodge', 'Pine Springs', 'Fairview', 'Heritage Home']
	patient.residence = residences.shuffle.sample

end

categories = InterestCategory.create([{name: "Favourite Music"},
								{name: "Favourite Sports"},
								{name: "Favourite Radio"},
								{name: "Favourite TV/Movies"},
								{name: "Favourite Childhood Games"},
								{name: "Favourite Actors"},
								{name: "Favourite Activities/Hobbies"},
								{name: "Favourite Animals"}])
