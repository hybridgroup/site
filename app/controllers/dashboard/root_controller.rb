class Dashboard::RootController < Dashboard::Controller
  def index
    summary
  end

  def summary
    @users = User.count
    @proposals = Proposal.count
    @votes = Vote.count
    popular_votes = Vote.count('proposal_id',
                               :group => 'proposal_id',
                               :order => 'count(proposal_id) desc',
                               :limit => 50)
    holding = popular_votes.map { |temp| temp }
    holding.map { |i| i[0]=Proposal.find(i[0]).title }
    @popular_proposals = holding

    @recent_users = User.find(:all, 
                              :conditions => 'last_login_date is not null',
                              :order => 'last_login_date desc',
                              :limit => 10)
  end
end
