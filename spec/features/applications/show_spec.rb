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

      expect(page).to have_content("Name: #{@application_1.applicant}")
      expect(page).to have_content("Street Address: #{@application_1.street_address}")
      expect(page).to have_content("City: #{@application_1.city}")
      expect(page).to have_content("State: #{@application_1.state}")
      expect(page).to have_content("Zip Code: #{@application_1.zip_code}")
      expect(page).to have_content("Description: #{@application_1.description}")

      visit "/applications/#{@application_2.id}"

      expect(page).to have_content("Name: #{@application_2.applicant}")
      expect(page).to have_content("Street Address: #{@application_2.street_address}")
      expect(page).to have_content("City: #{@application_2.city}")
      expect(page).to have_content("State: #{@application_2.state}")
      expect(page).to have_content("Zip Code: #{@application_2.zip_code}")
      expect(page).to have_content("Description: #{@application_2.description}")
    end

    it 'shows me all the pets the application is for' do
      visit "/applications/#{@application_1.id}"

      expect(page).to have_content("Pet: #{@pet_1.name}")
      expect(page).to have_content("Pet: #{@pet_2.name}")

      visit "/applications/#{@application_2.id}"

      expect(page).to have_content("Pet: #{@pet_2.name}")
    end

    it 'shows me the application status' do
      visit "/applications/#{@application_1.id}"

      expect(page).to have_content("Application Status: In Progress")

      visit "/applications/#{@application_2.id}"

      expect(page).to have_content("Application Status: In Progress")
    end
  end

  describe 'and the application has not been submitted' do
    it 'has a section to add pet to the application' do
      visit "/applications/#{@application_1.id}"
      expect(page).to have_content("Add a Pet to this Application")
    end
    
    it 'can search for pets by name' do
      visit "/applications/#{@application_1.id}"
      fill_in(:search, with: 'Wimbledon')
      click_button('Search')
      expect(current_path).to eq("/applications/#{@application_1.id}")
      
      expect(page).to have_content("#{@pet_3.name}")
      expect('Search').to appear_before("#{@pet_3.name}")
    end
    
    xit 'only shows this section if the application has not been submitted' do
      visit "/applications/#{@application_3.id}"
      expect(page).to have_no_content("Add a Pet to this Application")
      expect(page).to have_no_content("Search")
    end
  end

end

# As a visitor
# When I visit an application's show page
# And that application has not been submitted,
# Then I see a section on the page to "Add a Pet to this Application"
# In that section I see an input where I can search for Pets by name
# When I fill in this field with a Pet's name
# And I click submit,
# Then I am taken back to the application show page
# And under the search bar I see any Pet whose name matches my search


