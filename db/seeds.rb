# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = InterestCategory.create([{name: "Favourite Music"},
								{name: "Favourite Sports"},
								{name: "Favourite Radio"},
								{name: "Favourite TV/Movies"},
								{name: "Favourite Childhood Games"},
								{name: "Favourite Actors"},
								{name: "Favourite Activities/Hobbies"},
								{name: "Favourite Animals"}])
