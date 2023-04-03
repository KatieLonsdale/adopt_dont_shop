require 'rails_helper'

RSpec.describe 'the admin application show page' do
  before(:each) do 
    test_data
  end

  describe "When I visit an admin application show page" do
    it 'exists' do 
      visit "/admin/applications/#{@application_2.id}"

      within("#application-info") do
        expect(page).to have_content("Name: Jane Doe")
      end
    end
  end

  describe "For every pet that the application is for, I see a button to approve the application for that specific pet"
    it 'for each pet there is a button to approve' do 
      visit "/admin/applications/#{@application_2.id}"

      within("#application-info") do
        expect(page).to have_selector(:link_or_button, 'Approve Spike')
      end
    end
  
  describe "When I click that button then I'm taken back to the admin application show page" do
    it 'can click button and is redirected' do
      visit "/admin/applications/#{@application_2.id}"
      
      click_on 'Approve Spike'
    
      expect(current_path).to eq("/admin/applications/#{@application_2.id}")
    end
  end

  describe 'Next to the pet that I approved, I do not see a button to approve this pet' do
    it 'hides approve button after a pet application has been approved' do
      visit "/admin/applications/#{@application_2.id}"

      click_on 'Approve Spike'

      within("#application-info") do
        expect(page).to_not have_selector(:link_or_button, 'Approve Spike')
        expect(page).to have_content("Pet Status: Approved")
      end

      within("#application-status") do
        expect(page).to have_content("Approved")
      end
    end
  end

  describe "For every pet that the application is for, I see a button to reject the application for that specific pet"
    it 'for each pet there is a button to reject' do 
      visit "/admin/applications/#{@application_2.id}"

      within("#application-info") do
        expect(page).to have_selector(:link_or_button, 'Reject Spike')
      end
    end
  
  describe "When I click that button then I'm taken back to the admin application show page" do
    it 'can click button and is redirected' do
      visit "/admin/applications/#{@application_2.id}"
      
      click_on 'Reject Spike'
    
      expect(current_path).to eq("/admin/applications/#{@application_2.id}")
    end
  end

  describe 'Next to the pet that I rejected, I do not see a button to reject this pet' do
    it 'hides reject button after a pet application has been rejected' do
      visit "/admin/applications/#{@application_2.id}"

      click_on 'Reject Spike'

      within("#application-info") do
        expect(page).to_not have_selector(:link_or_button, 'Reject Spike')
        expect(page).to have_content("Pet Status: Rejected")
      end

      within("#application-status") do
        expect(page).to have_content("Rejected")
      end
    end
  end

  describe 'When there are two applications in the system for the same pet and I approve or reject the pet for that application' do
    it "I visit the other application's admin show page then I do not see that the pet has been accepted or rejected for that application" do
      visit "/admin/applications/#{@application_1.id}"

      click_on 'Reject Spike'

      within("#application-status") do
        expect(page).to have_content("Rejected")
      end

      visit "/admin/applications/#{@application_2.id}"

      within("#application-info") do
        expect(page).to_not have_content("Pet Status")
      end
    end

    it 'Shows buttons to approve or reject the pet for this specific application' do
      visit "/admin/applications/#{@application_1.id}"

      click_on 'Reject Spike'

      visit "/admin/applications/#{@application_2.id}"

      within("#application-info") do
        expect(page).to have_selector(:link_or_button, 'Reject Spike')
      end
    end

    it 'can also do it for approve' do
      visit "/admin/applications/#{@application_1.id}"

      click_on 'Approve Spike'

      within("#application-status") do
        expect(page).to have_content("Approved")
      end

      visit "/admin/applications/#{@application_2.id}"

      within("#application-info") do
        expect(page).to_not have_content("Pet Status")
      end
    end
  end
end