require "open-uri"

class SitePlantsController < ApplicationController

  def new
    @site = Site.find(params[:site_id])
    @site_plant = SitePlant.new
  end

  def create
    @site = Site.find(params[:site_id])
    @site_plant = SitePlant.new
    @plant = Plant.find(params[:plant_id])
    @site_plant.plant = @plant
    @site_plant.site = @site
    @site_plant.save

    log = Log.new(date: Date.new, description: "Planted", title: @site_plant.plant.latin_name)
    log.site = @site
    log.site_plant = @site_plant
    # file = URI.open(@plant.image_url)
    # log.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
    if log.save
      redirect_to site_search_path(@site)
    else
      raise
    end
  end

  private

  def site_plant_params
    params.require(:site_plant).permit(:plant_id, :photo)
  end
end
