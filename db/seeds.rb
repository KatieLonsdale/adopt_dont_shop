# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Veterinarian.destroy_all
VeterinaryOffice.destroy_all
PetsApplication.destroy_all
Pet.destroy_all
Application.destroy_all
Shelter.destroy_all

vet_office_1 = VeterinaryOffice.create(name: 'The Country Vet', boarding_services: true, max_patient_capacity: 200)
vet_office_2 = VeterinaryOffice.create(name: 'Jefferson Hospital', boarding_services: true, max_patient_capacity: 100)
vet_1 = Veterinarian.create(name: 'Taylor', review_rating: 10, on_call: false, veterinary_office_id: vet_office_1.id)
vet_2 = Veterinarian.create(name: 'Brian', review_rating: 5, on_call: true, veterinary_office_id: vet_office_1.id)
vet_3 = Veterinarian.create(name: 'Stephanie', review_rating: 8, on_call: true, veterinary_office_id: vet_office_2.id)
shelter_1 = Shelter.create!(foster_program: true, name: "Chatfield Shelter", city: "Littleton", rank: 1)
shelter_2 = Shelter.create!(foster_program: true, name: "Erie Shelter", city: "Erie", rank: 2)
application_1 = Application.create!(applicant: "Joe Smith", street_address: "123 Everywhere Street", city: "Anytown", state: "NY", zip_code: "13827")
application_2 = Application.create!(applicant: "Jane Doe", street_address: "455 Mulberry Street", city: "Springfield", state: "MA", zip_code: "53245")
application_3 = Application.create!(applicant: "Calvin Hobbes", street_address: "8960 Windy Lane", city: "Hartford", state: "CT", zip_code: "06066", status: "Pending")
application_4 = Application.create!(applicant: "Garfield Arbuckle", street_address: "11 Drury Lane", city: "Pillsbury", state: "KY", zip_code: "04248", status: "Accepted")
application_5 = Application.create!(applicant: "Sigfried Roy", street_address: "3200 Las Vegas Boulevard", city: "Las Vegas", state: "NV", zip_code: "90342", status: "Rejected")
application_6 = Application.create!(applicant: "Regina Phalange", street_address: "4246 Friends Circle", city: "New York", state: "NY", zip_code: "43245")
pet_1 = Pet.create!(adoptable: true, age: 2, breed: "Chow Chow", name: "Spot", shelter_id: shelter_1.id)
pet_2 = Pet.create!(adoptable: true, age: 1, breed: "Labrador", name: "Spike", shelter_id: shelter_1.id)
pet_3 = Pet.create!(adoptable: true, age: 6, breed: "Corgi", name: "Wimbledon", shelter_id: shelter_2.id)
joe_spot = PetsApplication.create!(application: application_1, pet: pet_1)
joe_spike = PetsApplication.create!(application: application_1, pet: pet_2)
jane_spike = PetsApplication.create!(application: application_2, pet: pet_2)

