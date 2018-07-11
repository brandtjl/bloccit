class AdvertisementsController < ApplicationController
  def index
    @adverts = Advertisement.all 
  end

  def show
    @advert = Advertisement.find(params[:id])
  end

  def new
    @advert = Advertisement.new
  end

  def create
    @advert = Advertisement.new
    @advert.title = params[:advertisement][:title] # not sure what/where these params are coming from!
    @advert.copy = params[:advertisement][:copy]
    @advert.price = params[:advertisement][:price]

    if @advert.save
      flash[:notice] = "Advertisement was saved."
      redirect_to @advert
    else
      flash.new[:alert] = "There was an error saving the advertisement. Please try again."
      render :new
    end 
  end
end
