module PresentationsHelper
  def display_speakers presentation
    presentation.speakers.map {| speaker |
      link_to(speaker.profile.full_name, profile_path(speaker.profile))
    }.join(", ")
  end

end
