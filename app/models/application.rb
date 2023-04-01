class Application < ApplicationRecord
  has_many :pets_applications
  has_many :pets, through: :pets_applications

  validates :applicant, presence: true
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true
  validates :description, presence: true
  
  def find_app_pets
    pets = PetsApplication.select(:pet_id).where(application_id: id)
    Pet.where(id: pets)
  end
end