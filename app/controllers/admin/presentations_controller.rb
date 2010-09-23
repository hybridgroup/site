class Admin::PresentationsController < ApplicationController

  layout "admin"

  def index
    @presentations = Presentation.all :order => 'presentation_date_time'
  end

  def new
    @presentation = Presentation.new
  end

  def edit
    @presentation = Presentation.find(params[:id])
  end

  def create
    @presentation = Presentation.create(params[:presentation])

    if @presentation.save then
      flash[:success] = "The presentation was created successfully."
    else
      flash[:error] = "An error occurred while creating the presentaiton: " +
        @presentation.errors.full_message.to_sentence
    end

    redirect_to admin_presentations_path
  end

  def update
    @presentation = Presentation.find(params[:id])

    @presentation.attributes = params[:presentation]

    if @presentation.save
      flash[:success]="Presentation changes saved successfully."
    else
      flash[:error]="Presentation changes could not be saved: " +
        @presentation.errors.full_messages.to_sentence
    end

    redirect_to admin_presentations_path
  end

  def destroy
    @presentation = Presentation.find(params[:id])
  end

end
