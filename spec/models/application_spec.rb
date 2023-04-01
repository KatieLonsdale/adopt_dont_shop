require 'rails_helper'

RSpec.describe Application do
  describe 'relationships' do
    it {should have_many :pets_applications}
    it {should have_many(:pets).through(:pets_applications)}
  end

  describe 'validations' do 
    it {should validate_presence_of :applicant}
    it {should validate_presence_of :street_address}
    it {should validate_presence_of :city}
    it {should validate_presence_of :state}
    it {should validate_presence_of :zip_code}
    it {should validate_presence_of :description}
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
  end
end