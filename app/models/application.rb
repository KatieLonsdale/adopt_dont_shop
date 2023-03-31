class Application < ApplicationRecord
  has_many :pets_applications
  has_many :pets, through: :pets_applications

  def find_app_pets
    pets = PetsApplication.select(:pet_id).where(application_id: id)
    Pet.where(id: pets)
  end
end