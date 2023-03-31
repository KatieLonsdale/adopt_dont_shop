require 'rails_helper'

RSpec.describe 'application new page' do
  before :each do
    test_data
   end
  
  describe 'As a visitor when I visit the pet index page then I see a link to "Start an Application"' do
    it 'has link to a new application' do 
      visit "/pets"

      expect(page).to have_content("Start an Application")
    end

    it 'can click the link to get to the new application page' do 
      visit "/pets"

      click_on "Start an Application"

      expect(current_path).to eq("/applications/new")
    end

    it 'after clicking the link there is a new application page with a form'
      visit "/applications/new"

      expect(page).to have_content("Applicant Name")
      expect(page).to have_content("Street Address")
      expect(page).to have_content("City")
      expect(page).to have_content("State")
      expect(page).to have_content("Zip Code")
      expect(page).to have_content("Description of why I would make a good home")
      expect(page).to have_content("Submit")

   end
end




# As a visitor
# When I visit the pet index page
# Then I see a link to "Start an Application"
# When I click this link
# Then I am taken to the new application page where I see a form
# When I fill in this form with my:

# Name
# Street Address
# City
# State
# Zip Code
# Description of why I would make a good home
# And I click submit
# Then I am taken to the new application's show page
# And I see my Name, address information, and description of why I would make a good home
# And I see an indicator that this application is "In Progress"