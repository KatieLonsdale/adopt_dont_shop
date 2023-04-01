class PetsApplicationsController < ApplicationController
  def create
    pet_application = PetsApplication.new(pets_applications_params)
    pet_application.save
    redirect_to "/applications/#{params[:application_id]}"
  end

  private
  def pets_applications_params
    params.permit(:application_id, :pet_id)
  end
end