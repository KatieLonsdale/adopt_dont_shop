# As a visitor
# When I visit the admin shelter index ('/admin/shelters')
# Then I see all Shelters in the system listed in reverse alphabetical order by name

require 'rails_helper'

RSpec.describe 'the admin shelters index page' do
  before(:each) do 
    test_data
  end

  describe 'When I visit the admin shelter index' do 
    it 'exists' do
      visit '/admin/shelters'

      expect(current_path).to eq('/admin/shelters')
      
      within("#title") do
        expect(page).to have_content("Admin Shelters Index")
      end
    end
  end
  
  describe 'I see all Shelters in the system listed in reverse alphabetical order by name' do
    it 'displays all shelters' do 
      visit '/admin/shelters'

      within("#shetler-info") do
        expect(page).to have_content("Chatfield Vet")
        expect(page).to have_content("A Friend of Jack")
      end
    end

    it 'by reverse alphabetical order' do
      visit '/admin/shelters'

      within("#shetler-info") do
        expect("Chatfield Vet").to appear_before("A Friend of Jack")
      end
    end
  end
end
  