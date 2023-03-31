require 'rails_helper'

RSpec.describe 'the applications show page' do
  before :each do
    @shelter_1 = Shelter.create!(foster_program: true, name: "Chatfield Vet", city: "Littleton", rank: 1)
    @application_1 = Application.create!(applicant: "Joe Smith", street_address: "123 Everywhere Street", city: "Anytown", state: "NY", zip_code: "13827", description: "I am lonely and need a pet.")
    @application_2 = Application.create!(applicant: "Jane Doe", street_address: "455 Mulberry Street", city: "Springfield", state: "MA", zip_code: "53245", description: "I like dogs.")
    @pet_1 = Pet.create!(adoptable: true, age: 2, breed: "Chow Chow", name: "Spot", shelter_id: @shelter_1.id)
    @pet_2 = Pet.create!(adoptable: true, age: 2, breed: "Labrador", name: "Spike", shelter_id: @shelter_1.id)
    @joe_spot = PetsApplication.create!(application: @application_1, pet: @pet_1)
    @joe_spike = PetsApplication.create!(application: @application_1, pet: @pet_2)
    @jane_spike = PetsApplication.create!(application: @application_2, pet: @pet_2)
  end
  describe 'As a visitor, when I visit an applications show page' do
    it 'exists' do
      visit "/applications/#{@application_1.id}"
    end

    it 'shows me the applicant details' do
      visit "applications/#{@application_1.id}"

      expect(page).to have_content("Name: #{@application_1.applicant}")
      expect(page).to have_content("Street Address: #{@application_1.street_address}")
      expect(page).to have_content("City: #{@application_1.city}")
      expect(page).to have_content("State: #{@application_1.state}")
      expect(page).to have_content("Zip Code: #{@application_1.zip_code}")
      expect(page).to have_content("Description: #{@application_1.description}")

      visit "applications/#{@application_2.id}"

      expect(page).to have_content("Name: #{@application_2.applicant}")
      expect(page).to have_content("Street Address: #{@application_2.street_address}")
      expect(page).to have_content("City: #{@application_2.city}")
      expect(page).to have_content("State: #{@application_2.state}")
      expect(page).to have_content("Zip Code: #{@application_2.zip_code}")
      expect(page).to have_content("Description: #{@application_2.description}")
    end

    it 'shows me all the pets the application is for' do
      visit "applications/#{@application_1.id}"

      expect(page).to have_content("Pet: #{@pet_1.name}")
      expect(page).to have_content("Pet: #{@pet_2.name}")

      visit "applications/#{@application_2.id}"

      expect(page).to have_content("Pet: #{@pet_2.name}")
    end
  end

end


# names of all pets that this application is for (all names of pets should be links to their show page)
# The Application's status, either "In Progress", "Pending", "Accepted", or "Rejected"

# add index page