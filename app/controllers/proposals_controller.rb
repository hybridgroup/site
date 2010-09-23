class ProposalsController < ApplicationController

  before_filter :require_user unless :index

  def new
    @proposal = Proposal.new
    render :layout => 'admin'
  end

  def edit
    @proposal = Proposal.find(params[:id])
    render :layout => 'admin'
  end

  def create
    @proposal = Proposal.create(params[:proposal])
    @proposal.user = session.user

    if @proposal.save then
      flash[:success] = "Your proposal has been successfully saved."
    else
      flash[:error] = "An error occurred while saving your proposal: " +
        @proposal.errors.full_messages.to_sentence
    end

    redirect_to user_proposals_path(session.user)
  end

  def update
    @proposal = Proposal.find(params[:id])

    @proposal.update_attributes(params[:proposal])

    if @proposal.save then
      flash[:success] = "Your changes to the proposal were successfully saved."
    else
      flash[:error] = "An error occured while saving your proposal: " +
        @proposal.errors.full_messages.to_sentence
    end
    redirect_to user_proposals_path(session.user)
  end

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @proposals = @user.proposals
    else
      @proposals = Proposal.find(:all, :order => 'created_at',
                                 :conditions => ['created_at < ? ',
                                                 '2010-01-13'])
      @user = nil
    end
  end

  def show
    @proposal = Proposal.find(params[:id])
    @all = true
  end

  def view_comments
    @proposal = Proposal.find(params[:id])
    @all = true
    render :layout => false
  end

  def destroy
    @proposal = Proposal.find(params[:id])

    @proposal.remove!

    redirect_to user_proposals_path(session.user)
  end

  def liked
    @proposal = Proposal.find(params[:id])
    @likers = @proposal.votes.map { |v| v.user }
    render :layout => 'lightbox'
  end
end
