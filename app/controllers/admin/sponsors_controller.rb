class Admin::SponsorsController < Admin::Controller
  layout "admin"
  def index
    @sponsors = Sponsor.all
  end

  def new
    @sponsor = Sponsor.new
  end

  def edit
    @sponsor = Sponsor.find(params[:id])
  end

  def create
    @sponsor = Sponsor.create params[:sponsor]

    if @sponsor.save
      flash[:success] = "The new sponsor was successfully created."
    else
      flash[:error] = "An error occurred while creating the sponsor: " +
        @sponsor.errors.full_messages.to_sentence
      end

    redirect_to admin_sponsors_path
  end

  def update
    @sponsor = Sponsor.find(params[:id])

    unless params[:commit] == "Cancel"
      @sponsor.attributes = params[:sponsor]

      if @sponsor.save
        flash[:success] = "The sponsor has been successfully updated."
      else
        flash[:error] = "An error occurred while updating the sponsor.  " +
          @sponsor.errors.full_messages.to_sentence
      end
    end
    redirect_to admin_sponsors_path
  end

  def destroy
    @sponsor = Sponsor.find(params[:id])
    if @sponsor.destroy
      flash[:success]="Sponsor successfully deleted."
    else
      flash[:error] = "Sponsor could not be deleted: " +
        "#{@sponsor.errors.full_messages.to_sentence}"
    end

    redirect_to admin_sponsors_path
  end

end
