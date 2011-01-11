class Admin::SpeakersController < Admin::Controller

  layout "admin"

  def index
    @speakers = Speaker.all
  end

  def new
    @speaker = Speaker.new
    @profiles = Profile.all :order => 'last_name, first_name'
  end

  def edit
    @speaker = Speaker.find(params[:id])
    @profiles = Profile.all :order => 'last_name, first_name'
  end

  def create
    @speaker = Speaker.create(params[:speaker])

    if @speaker.save then
      flash[:success] = "The speaker was created successfully."
    else
      flash[:error] = "An error occurred while creating the speaker: " +
        @speaker.errors.full_message.to_sentence
    end

    redirect_to admin_speakers_path
  end

  def update
    @speaker = Speaker.find(params[:id])

    @speaker.attributes = params[:speaker]

    if @speaker.save
      flash[:success] = "Speaker changes saved successfully."
    else
      flash[:error] = "Speaker changes could not be saved: " +
        @speaker.errors.full_messages.to_sentence
    end

    redirect_to admin_speakers_path
  end

  def destroy
    @speaker = Speaker.find(params[:id])

    if @speaker.destroy
      flash[:success] = "Speaker has been removed"
    else
      flash[:error] = "Speaker was not removed: " +
        @speaker.errors.full_messages.to_sentence
    end
    redirect_to admin_speakers_path
  end
end
