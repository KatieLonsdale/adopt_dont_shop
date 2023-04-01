require 'rails_helper'

RSpec.describe 'the applications show page' do
  before :each do
   test_data
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

    it 'shows me the application status' do
      visit "applications/#{@application_1.id}"

      expect(page).to have_content("Application Status: In Progress")

      visit "applications/#{@application_2.id}"

      expect(page).to have_content("Application Status: In Progress")
    end
  end

end


