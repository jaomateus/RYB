class SitePlantController < ApplicationController

  def new
    @site_plant = Site_plant.new
  end

  def create
    @site_plant = Site_plant.new(site_plant_params)
    @site_plant.site = Site.find(params[:site_id])
    if @site_plant.save
      redirect_to site_search_path(@site)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def site_plant_params
    params.require(:site_plant).permit(:name, :commun_name, :latin_name)
  end

end
