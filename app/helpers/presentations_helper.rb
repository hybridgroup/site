module PresentationsHelper
  def display_speakers presentation
    presentation.speakers.map {| speaker |
      link_to(speaker.profile.full_name, speaker_path(speaker))
    }.join(", ")
  end

end
