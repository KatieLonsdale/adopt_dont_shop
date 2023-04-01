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

    it 'after clicking the link there is a new application page with a form' do
      visit "/applications/new"

      within("#application") do
        expect(page).to have_content("New Application")
        expect(page).to have_content("Applicant Name:")
        expect(page).to have_content("Street Address:")
        expect(page).to have_content("City:")
        expect(page).to have_content("State:")
        expect(page).to have_content("Zip Code:")
        expect(page).to have_content("Description of why I would make a good home:")
      end
    end

    it 'can fill in the application' do
      visit "/applications/new"

      fill_in 'applicant', with: "John Doe"
      fill_in 'street_address', with: "456 Main St."
      fill_in 'city', with: "Westminster"
      fill_in 'state', with: "Colorado"
      fill_in 'zip_code', with: "80020"
      fill_in 'description', with: "I like critters"
      
      click_on "Submit"
      
      within("#application") do
        expect(page).to have_content("John Doe")
        expect(page).to have_content("456 Main St.")
        expect(page).to have_content("Westminster")
        expect(page).to have_content("Colorado")
        expect(page).to have_content("80020")
        expect(page).to have_content("I like critters")
      end
    end
  end
end

