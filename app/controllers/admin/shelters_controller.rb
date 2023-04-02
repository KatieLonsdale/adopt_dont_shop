class Admin::SheltersController < ApplicationController
  def index
   @shelters = Shelter.shelters_by_name
   @shelters_with_apps = Shelter.shetler_w_apps
  end
end
