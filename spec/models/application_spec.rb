require 'rails_helper'

RSpec.describe Application do
  describe 'relationships' do
    it {should have_many :pets_applications}
    it {should have_many(:pets).through(:pets_applications)}
  end

  describe '#instance_methods' do
    before :each do
      @shelter_1 = Shelter.create!(foster_program: true, name: "Chatfield Vet", city: "Littleton", rank: 1)
      @application_1 = Application.create!(applicant: "Joe Smith", street_address: "123 Everywhere Street", city: "Anytown", state: "NY", zip_code: "13827", description: "I am lonely and need a pet.")
      @application_2 = Application.create!(applicant: "Jane Doe", street_address: "455 Mulberry Street", city: "Springfield", state: "MA", zip_code: "53245", description: "I like dogs.")
      @pet_1 = Pet.create!(adoptable: true, age: 2, breed: "Chow Chow", name: "Spot", shelter_id: @shelter_1.id)
      @pet_2 = Pet.create!(adoptable: true, age: 2, breed: "Labrador", name: "Spike", shelter_id: @shelter_1.id)
      @joe_spot = PetsApplication.create!(application: @application_1, pet: @pet_1)
      @joe_spike = PetsApplication.create!(application: @application_1, pet: @pet_2)
      @jane_spike = PetsApplication.create!(application: @application_2, pet: @pet_2)
    end
    describe '#find_app_pets' do
      it 'returns the pets applied for on an application' do
        expect(@application_1.find_app_pets).to eq([@pet_1.name, @pet_2.name])
      end
    end
  end
end