require 'rails_helper'

RSpec.describe Application do
  describe 'relationships' do
    it {should have_many :pets_applications}
    it {should have_many(:pets).through(:pets_applications)}
  end

  describe 'validations' do 
    it {should validate_presence_of :applicant}
    it {should validate_length_of(:applicant).is_at_least(2) }
    it {should validate_presence_of :street_address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip_code}
    it {should validate_length_of(:zip_code).is_equal_to(5)}
    it {should validate_numericality_of(:zip_code)}
  end

  describe '#instance_methods' do
    before :each do
      test_data
    end
    describe '#find_app_pets' do
      it 'returns the pets applied for on an application' do
        expect(@application_1.find_app_pets).to eq([@pet_1, @pet_2])
      end
    end
    describe '#pets_selected?' do
      it 'returns true if there are pets on the application' do
        expect(@application_1.pets_selected?).to be true
        expect(@application_7.pets_selected?).to be false
      end
    end
  end
end