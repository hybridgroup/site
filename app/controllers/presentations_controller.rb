class PresentationsController < ApplicationController
  def index
    @conference = Presentation.find(:all,
                                    :order => 'presentation_date_time',
                                    :conditions =>
                        ['presentation_date_time > ?', '2011-02-05 12:00 AM']
                                    )
  end

  def show
    @presentation = Presentation.find(params[:id])
  end
end
