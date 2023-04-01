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
      visit "/applications/#{@application_1.id}"
      within("#application-info") do
        expect(page).to have_content("Name: #{@application_1.applicant}")
        expect(page).to have_content("Street Address: #{@application_1.street_address}")
        expect(page).to have_content("City: #{@application_1.city}")
        expect(page).to have_content("State: #{@application_1.state}")
        expect(page).to have_content("Zip Code: #{@application_1.zip_code}")
        expect(page).to have_content("Description: #{@application_1.description}")
      end

      visit "/applications/#{@application_2.id}"
      within("#application-info") do
        expect(page).to have_content("Name: #{@application_2.applicant}")
        expect(page).to have_content("Street Address: #{@application_2.street_address}")
        expect(page).to have_content("City: #{@application_2.city}")
        expect(page).to have_content("State: #{@application_2.state}")
        expect(page).to have_content("Zip Code: #{@application_2.zip_code}")
        expect(page).to have_content("Description: #{@application_2.description}")
      end
    end

    it 'shows me all the pets the application is for' do
      visit "/applications/#{@application_1.id}"
      within("#application-info") do
        expect(page).to have_content("Pet: #{@pet_1.name}")
        expect(page).to have_content("Pet: #{@pet_2.name}")
      end

      visit "/applications/#{@application_2.id}"
      within("#application-info") do
        expect(page).to have_content("Pet: #{@pet_2.name}")
      end
    end

    it 'shows me the application status' do
      visit "/applications/#{@application_1.id}"
      within("#application-status") do
        expect(page).to have_content("Application Status: In Progress")
      end

      visit "/applications/#{@application_2.id}"
      within("#application-status") do
        expect(page).to have_content("Application Status: In Progress")
      end
    end
  end

  describe 'and the application has not been submitted' do
    it 'has a section to add pet to the application' do
      visit "/applications/#{@application_1.id}"
      within("#add-pet") do
        expect(page).to have_content("Add a Pet to this Application")
      end
    end
    
    it 'can search for pets by name' do
      visit "/applications/#{@application_1.id}"
      within("#add-pet") do
        fill_in(:search, with: 'Wimbledon')
        click_button('Search')
        expect(current_path).to eq("/applications/#{@application_1.id}")
        
        expect(page).to have_content("#{@pet_3.name}")
        expect('Search').to appear_before("#{@pet_3.name}")
      end
    end
    
    it 'only shows this section if the application status is In Progress' do
      visit "/applications/#{@application_3.id}"
      expect(page).to have_no_content("Add a Pet to this Application")
      expect(page).to have_no_content("Search")

      visit "/applications/#{@application_4.id}"
      expect(page).to have_no_content("Add a Pet to this Application")
      expect(page).to have_no_content("Search")

      visit "/applications/#{@application_5.id}"
      expect(page).to have_no_content("Add a Pet to this Application")
      expect(page).to have_no_content("Search")
    end
  end
end


