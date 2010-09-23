class VotesController < ApplicationController
  def create
    @vote = Vote.new
    @vote.proposal_id = params[:proposal_id]
    @vote.user_id = session.user.id
    @vote.save

    render :partial => 'votes/unlike', :locals => { :proposal => @vote.proposal }
  end

  def destroy
    @vote = Vote.find(params[:id])
    proposal = @vote.proposal

    @vote.destroy

    render :partial => 'votes/unlike', :locals => { :proposal => proposal }
  end
end
