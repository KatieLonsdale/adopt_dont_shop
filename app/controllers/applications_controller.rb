class ApplicationsController < ApplicationController

  def show
    @pets = []
    @pets = Pet.search(params[:search]) if params[:search].present?
    @application = Application.find(params[:application_id])
  end
end