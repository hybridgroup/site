class PresentationsController < ApplicationController
  def index
    @conference = Presentation.find(:all,
                                    :order => 'presentation_date_time'
                                    )
    @r1m = Presentation.find_by_place_holder("r1m")
    @r1a = Presentation.find_by_place_holder("r1a")
    @r2m = Presentation.find_by_place_holder("r2m")
    @r2a = Presentation.find_by_place_holder("r2a")
    @r3m = Presentation.find_by_place_holder("r3m")
    @r3a = Presentation.find_by_place_holder("r3a")
  end

  def show
    @presentation = Presentation.find(params[:id])
  end
end
