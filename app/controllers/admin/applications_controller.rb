class Admin::ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:application_id])
  end

  def update
    @application = Application.find(params[:application_id])
    if params[:pet_status] == "approved"
      @application.update(status: "Approved")
    else
      @application.update(status: "Rejected")
    end
    @application.save
    redirect_to "/admin/applications/#{@application.id}"
  end
end