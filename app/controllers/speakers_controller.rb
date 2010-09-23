class SpeakersController < ApplicationController
  def index
    @speakers = Speaker.find(:all,
                            :order => 'profiles.last_name, profiles.first_name',
                             :include => 'profile')
  end

  def show
    @speaker = Speaker.find(params[:id])
  end
end
