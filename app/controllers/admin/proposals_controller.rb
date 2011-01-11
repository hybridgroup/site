class Admin::ProposalsController < Admin::Controller
  layout "admin"

  def index
    @proposals = Proposal.all :order => "updated_at desc"
  end

  def new
    @proposal = Proposal.new
  end

  def edit
    @proposal = Proposal.find(params[:id])
  end

  def update
    @proposal = Proposal.find(params[:id])

    @proposal.attributes = params[:proposal]

    if @proposal.save
      flash[:success] = "Proposal changes saved successfully."
    else
      flash[:error] = "An error occurred while creating the proposal: " +
        @proposal.errors.full_message.to_sentence
    end

    redirect_to admin_proposals_path
  end

end
