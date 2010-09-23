class SponsorsController < ApplicationController
  def index
    @sponsors = Sponsor.find(:all,
                             :conditions => ["sponsor_date <= ?",
                                             Date.today],
                             :order => 'sponsor_level, sponsor_date')
  end

  def show
    @sponsor = Sponsor.find(params[:id])
  end
end
