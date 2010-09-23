class Dashboard::Controller < ApplicationController

  before_filter :require_user
  # Anyone can see the dashboards, adding them to the community section.
  # before_filter :require_dashboard_user

  def require_dashboard_user
    unless session.user.admin? && session.user.dashboard?
      flash[:error] = "You do not have permission to access this feature."
      redirect_to home_path
    end
  end
end
