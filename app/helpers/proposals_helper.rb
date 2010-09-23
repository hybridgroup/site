module ProposalsHelper
  def users_vote proposal, user
    proposal.votes[proposal.votes.map { |v| v.user }.index(user)]
  end

  def liked_by_message proposal, user
    if proposal.votes.size > 0 then
      "#{pluralize(proposal.votes.size,'person')} liked this proposal."
    end
  end
end
