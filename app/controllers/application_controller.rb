require 'intercession'

class ApplicationController < ActionController::Base
  include Intercession

  helper :all
  protect_from_forgery
  filter_parameter_logging :password

  before_filter :set_time_zone

  before_filter :load_sponsors

  protected

  def load_sponsors
    @ruby = Sponsor.ruby.all
    @gold = Sponsor.gold.all
    @silver = Sponsor.silver.all
    @sponsors = Sponsor.all :order => 'sponsor_level, sponsor_date desc'
  end

  def set_time_zone
    unless session.anonymous? || session.user.time_zone.blank?
      Time.zone = session.user.time_zone
    end
  end

  def require_user
    if session.anonymous?
      flash[:error] = "You need to be logged in to do that."
      session.bookmark = url_for params
      redirect_to new_session_path
    end
  end
end
