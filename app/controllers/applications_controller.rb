class ApplicationsController < ApplicationController

  def show
    @application = Application.find(params[:application_id])
  end

  def new
  end

  def create
    application = Application.create(application_params)
    redirect_to "/applications/#{application.id}"
  end

  private
  def application_params
    params.permit(:applicant, :street_address, :city, :state, :zip_code, :description)
  end
end