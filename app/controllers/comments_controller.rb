class CommentsController < ApplicationController
  def new
    @comment = ProposalComment.new
    @comment.left_by = session.user
    @proposal = Proposal.find(params[:proposal_id])

    render :layout => false
  end

  def create
    proposal = Proposal.find(params[:proposal_id])
    @comment = ProposalComment.new params[:proposal_comment]
    @comment.left_by = session.user
    @comment.proposal = proposal

    if @comment.save then
      render :partial => 'proposals/display_comments',
             :locals => { :proposal => @comment.proposal }
    else
      flash[:error] = "Failed to save your comment: " +
        @comment.errors.full_messages.to_sentence

      render :text => flash[:error]
    end
  end

  def destroy
    @comment = ProposalComment.find(params[:id])
    proposal = @comment.proposal
    @comment.destroy
    render :partial => 'proposals/display_comments', 
           :locals => { :proposal => proposal }
  end
end
