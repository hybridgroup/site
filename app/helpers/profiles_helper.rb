module ProfilesHelper
  def twitter_link profile
    unless profile.twitter_account.blank?
      "Follow me on twitter " +
        link_to("@#{profile.twitter_account}",
                'http://twitter.com/' + profile.twitter_account,
                :target => '_blank') +
        "."
    end
  end

  def display_profile_completeness profile
    if profile.user == session.user then
      "Your profile is " +
        number_with_precision(profile.percent_complete,
                              :precision => 0) +
        "% complete."
    end
  end
end
