class PetsApplication < ApplicationRecord
  belongs_to :application
  belongs_to :pet

  private
  def pets_application_params
    params.permit(:pet_id, :application_id)
  end
end