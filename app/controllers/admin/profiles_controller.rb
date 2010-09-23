class Admin::ProfilesController < ApplicationController

  def index
    @profiles = Profile.all :order => 'last_name, first_name'
  end

  def new
    @profile = Profile.new
    @profile.user = User.find(params[:user_id])
  end
end
