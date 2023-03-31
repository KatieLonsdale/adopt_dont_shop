# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PetsApplication.destroy_all
Pet.destroy_all
Application.destroy_all
Shelter.destroy_all

shelter_1 = Shelter.create!(foster_program: true, name: "Chatfield Vet", city: "Littleton", rank: 1)
application_1 = Application.create!(applicant: "Joe Smith", street_address: "123 Everywhere Street", city: "Anytown", state: "NY", zip_code: "13827", description: "I am lonely and need a pet.")
application_2 = Application.create!(applicant: "Jane Doe", street_address: "455 Mulberry Street", city: "Springfield", state: "MA", zip_code: "53245", description: "I like dogs.")
pet_1 = Pet.create!(adoptable: true, age: 2, breed: "Chow Chow", name: "Spot", shelter_id: shelter_1.id)
pet_2 = Pet.create!(adoptable: true, age: 2, breed: "Labrador", name: "Spike", shelter_id: shelter_1.id)
joe_spot = PetsApplication.create!(application: application_1, pet: pet_1)
joe_spike = PetsApplication.create!(application: application_1, pet: pet_2)
jane_spike = PetsApplication.create!(application: application_2, pet: pet_2)