class ApplicationsController < ApplicationController

  def show
    @pets = []
    @pets = Pet.search(params[:search]) if params[:search].present?
    @application = Application.find(params[:application_id])
  end

  def new
  end

  def create
    @application = Application.create(application_params)
    if @application.save
      redirect_to "/applications/#{@application.id}"
    else
      flash[:error] = "Please ensure all fields are filled in."
      redirect_to "/applications/new"
    end
  end

  private
  def application_params
    params.permit(:applicant, :street_address, :city, :state, :zip_code, :description)
  end
end