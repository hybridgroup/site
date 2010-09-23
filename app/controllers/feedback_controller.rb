class FeedbackController < ApplicationController
  def new
    @feedback = Feedback.new params[:feedback]
    @feedback.name = cookies[:feedback_name]
    @feedback.email = cookies[:feedback_email]

    @remember_me = cookies[:feedback_email] || cookies[:feedback_name]
  end

  def create
    remember_me = params[:feedback].delete :remember_me
    @feedback = populate_metadata Feedback.new(params[:feedback])

    if session.user
      @feedback.user_id = session.user.id
    end

    if @feedback.save then
      update_cookies @feedback, remember_me
      render :template => 'feedback/thanks'
    else
      render :action => :new
    end
  end

  private

  def populate_metadata obj
    obj.domain     = request.domain
    obj.url        = request.url
    obj.referer    = request.referer
    obj.user_agent = request.env["HTTP_USER_AGENT"]
    obj.remote_ip  = request.remote_ip

    c = []
    c = c.inject({}) { |hash,key| hash[key] = cookies[key]; hash}.to_json

    obj.cookies = c
    obj
  end

  def update_cookies feedback, remember_me
    if remember_me then
      expires = { :expires => 1.year.from_now }

      cookies[:feedback_email]    = { :value => feedback.email }.merge expires
      cookies[:feedback_name]     = { :value => feedback.name  }.merge expires
    else
      cookies.delete :feedback_email
      cookies.delete :feedback_name
    end
  end
end
