class Admin::FeedbacksController < ApplicationController
  
  layout "admin"

  PAGE_SIZE = 20

  def index
    @feedbacks = Feedback.unreviewed.find(:all,
                                          :order => 'created_at desc'
                                          ).paginate(:page => params[:page],
                                                     :per_page => PAGE_SIZE)
  end

  def search
    if params[:q].blank? then
      params[:q]=":default"
    end
    @feedbacks = Feedback.search(params[:q]).paginate(:page => params[:page],
                                                      :per_page => PAGE_SIZE)
    render :template => '/admin/feedbacks/index'
  end

  def show
    @feedback = Feedback.find(params[:id])
  end

  def review
    @feedback = Feedback.find(params[:id])
    unless @feedback.reviewed?
      @feedback.review! session.user
      flash[:success] = "Feedback message (#{@feedback.id}) has been marked as reviewed."
    else
      flash[:error] = "This feedback message has already been reviewed."
    end

    redirect_to admin_feedbacks_path

  end
end
