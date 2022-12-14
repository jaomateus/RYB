require "open-uri"

class SitePlantsController < ApplicationController
  def show
    @site = Site.find(params[:site_id])
    @site_plant = "danko"
    @site_plant = SitePlant.find(params[:id]) unless params[:id] == "empty"

    if params[:query].present?
      sql_query = <<~SQL
        plants.latin_name ILIKE :query
        OR plants.common_name ILIKE :query
      SQL
      @site_plants = SitePlant.joins(:plant).where(sql_query, query: "%#{params[:query]}%")
    else
      @site_plants = SitePlant.where(site_id: @site.id)
    end
    if @site_plant != "danko"
      @logs = Log.where(site_id: @site.id, site_plant_id: @site_plant.id).order(date: :desc)
    end
  end

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

    log = Log.new(date: Date.today, title: "Planted: #{@site_plant.plant.latin_name} ")
    log.site = @site
    log.site_plant = @site_plant

    if log.save
      redirect_to site_search_path(@site)
    else
      raise
    end
  end

  def index
    @site = Site.find(params[:site_id])
    @site_plants = SitePlant.where(site_id: @site.id)

    if params[:query].present?
      sql_query = <<~SQL
        plant.latin_name ILIKE :query
        OR plant.common_name ILIKE :query
      SQL
      @site_plants = SitePlant.joins(:plant).where(sql_query, query: "%#{params[:query]}%")
    else
      @site_plants
    end
  end

  def destroy
    @site = Site.find(params[:site_id])
    @site_plant = SitePlant.find(params[:id])
    @site_plant.destroy
    redirect_to site_path(@site)
  end

  private

  def site_plant_params
    params.require(:site_plant).permit(:plant_id, :photo)
  end
end
