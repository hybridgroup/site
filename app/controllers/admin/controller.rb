class Admin::Controller < ApplicationController

  before_filter :require_user
  before_filter :require_admin_user

  def require_admin_user
    unless session.user.admin?
      redirect_to home_path
    end
  end
end
