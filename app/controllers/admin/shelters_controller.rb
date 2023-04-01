class Admin::SheltersController < ApplicationController
  def index
   @shelters = Shelter.raw_sql_query
   @shelters_with_apps = Shelter.shetler_w_apps
  end
end