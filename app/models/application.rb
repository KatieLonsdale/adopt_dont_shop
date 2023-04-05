class Application < ApplicationRecord
  has_many :pets_applications
  has_many :pets, through: :pets_applications

  validates :applicant, presence: true, length: { minimum: 2 }
  validates :street_address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip_code, presence: true, length: { is: 5}, numericality: { only_integer: true }

  def find_app_pets
    pets = PetsApplication.select(:pet_id).where(application_id: id)
    Pet.where(id: pets)
  end

  def pets_selected?
    pets = find_app_pets
    pets.empty? ? false : true
  end
end