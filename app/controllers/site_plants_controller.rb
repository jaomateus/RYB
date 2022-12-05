class SitePlantsController < ApplicationController

  def new
    @site = Site.find(params[:site_id])
    @site_plant = SitePlant.new
  end

  def create
    @site = Site.find(params[:site_id])
    @site_plant = SitePlant.new
    @site_plant.plant = Plant.find(site_plant_params[:plant_id]) if site_plant_params[:plant_id]
    @site_plant.site = Site.find(params[:site_id])
    redirect_to site_search_path(@site) if @site_plant.save
  end

  private

  def site_plant_params
    params.require(:site_plant).permit(:plant_id)
  end
end
