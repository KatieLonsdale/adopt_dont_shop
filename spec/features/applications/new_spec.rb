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
  describe 'after clicking the link there is a new application page with a form' do
    it 'exists' do
      visit "/applications/new"

      within("#application") do
        expect(page).to have_content("New Application")
        expect(page).to have_content("Applicant Name:")
        expect(page).to have_content("Street Address:")
        expect(page).to have_content("City:")
        expect(page).to have_content("State:")
        expect(page).to have_content("Zip Code:")
      end
    end

    it 'can fill in the application' do
      visit "/applications/new"

      fill_in 'applicant', with: "John Doe"
      fill_in 'street_address', with: "456 Main St."
      fill_in 'city', with: "Westminster"
      fill_in 'state', with: "Colorado"
      fill_in 'zip_code', with: "80020"
      
      click_on "Submit"

      within("#application-info") do
        expect(page).to have_content("John Doe")
        expect(page).to have_content("456 Main St.")
        expect(page).to have_content("Westminster")
        expect(page).to have_content("Colorado")
        expect(page).to have_content("80020")
      end
    end
  end

  describe 'can tell the user to fill in required fields when a form is not fully filled in'
    it 'will not accept an application without all fields filled in' do
      visit "/applications/new"

      fill_in 'applicant', with: "John Doe"
      fill_in 'street_address', with: "456 Main St."
      fill_in 'city', with: "Westminster"
      fill_in 'state', with: "Colorado"

      click_on "Submit"

      within("#flash") do
        expect(page).to have_content("Error: Zip code can't be blank")
        expect(page).to have_content("Zip code is the wrong length (should be 5 characters)")
        expect(page).to have_content("Zip code is not a number")
      end
    end

    it 'will not accept a name less than two characters' do
      visit "/applications/new"

      fill_in 'applicant', with: "J"
      fill_in 'street_address', with: "456 Main St."
      fill_in 'city', with: "Westminster"
      fill_in 'state', with: "Colorado"
      fill_in 'zip_code', with: "80020"

      click_on "Submit"

      within("#flash") do
        expect(page).to have_content("Error: Applicant is too short (minimum is 2 characters)")
      end
    end

    it 'will accept the application after all fields are filled in after receiving flash error' do
      visit "/applications/new"

      fill_in 'applicant', with: "John Doe"
      fill_in 'street_address', with: "456 Main St."
      fill_in 'city', with: "Westminster"
      fill_in 'state', with: "Colorado"

      click_on "Submit"

      fill_in 'applicant', with: "John Doe"
      fill_in 'street_address', with: "456 Main St."
      fill_in 'city', with: "Westminster"
      fill_in 'state', with: "Colorado"
      fill_in 'zip_code', with: "80020"

      click_on "Submit"

      within("#application-info") do
        expect(page).to have_content("John Doe")
        expect(page).to have_content("456 Main St.")
        expect(page).to have_content("Westminster")
        expect(page).to have_content("Colorado")
        expect(page).to have_content("80020")
      end
    end

  end
end
