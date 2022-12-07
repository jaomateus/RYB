class PlantsController < ApplicationController

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    @plant.site_id = @Site.find(params[:id])
    if @plant.save
      redirect_to plant_path(@plant)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @site = Site.find(params[:site_id])

    if params[:query].present?
      sql_query = <<~SQL
        plant.latin_name ILIKE :query
        OR plant.common_name ILIKE :query
        OR plant.description ILIKE :query
        OR directors.last_name ILIKE :query
      SQL
      @plants = Plant.where(sql_query, query: "%#{params[:query]}%")
    else
      @plants = Plant.all
    end
  end

  def edit
    @site = Site.find(params[:id])
  end

  def show
    @plant = Plant.find(params[:id])
    @site = Site.find(params[:site_id])
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :commun_name, :latin_name)
  end
end
