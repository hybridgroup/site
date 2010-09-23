class Admin::NewsItemsController < ApplicationController

  layout "admin"

  def index
    @news_items = NewsItem.paginate(:all,
                                   :order => 'display_date desc',
                                   :page => params[:page])
  end

  def new
    @news_item = NewsItem.new
  end

  def edit
    @news_item = NewsItem.find(params[:id])
  end

  def create
    @news_item = NewsItem.create params[:news_item]
    @news_item.user = session.user

    if @news_item.save
      flash[:success] = "News item successfully created."
    else
      flash[:error] = "An error occured while creating the news item: " +
        @news_item.errors.full_messages.to_sentence
    end

    redirect_to admin_news_items_path
  end

  def update
    @news_item = NewsItem.find(params[:id])

    @news_item.attributes = params[:news_item]

    if @news_item.save then
      flash[:success] = "Changes to the news item were successfully saved."
    else
      flash[:error] = "Failed to save your changes: " +
        @news_item.errors.full_messages.to_sentence
    end

    redirect_to admin_news_items_path
  end

end
