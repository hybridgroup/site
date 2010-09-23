class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
    @profile.user_id = params[:user_id]
  end

  def edit
    @profile = Profile.find(params[:id])
    @user = @profile.user
  end

  def create
    @profile = Profile.create params[:profile]

    if @profile.save
      flash[:success] = "Your profile has been successfully created."
    else
      flash[:error] = "An error occurred while creating your profile.  " +
        @profile.errors.full_messages.to_sentence
    end

    redirect_to user_path(@profile.user)
  end

  def update
    @profile = Profile.find(params[:id])

    unless params[:commit] == "Cancel"
      @profile.attributes = params[:profile]

      if @profile.save
        flash[:success] = "Your profile has been successfully updated."
      else
        flash[:error] = "An error occurred while updating your profile.  " +
          @profile.errors.full_messages.to_sentence
      end
    end
    redirect_to user_path(@profile.user)
  end

  def show
    @profile = Profile.find(params[:id])
  end

end
