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
    @plants = Plant.all
  end

  def show
    @site = Plant.find(params[:id])
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :commun_name, :latin_name)
  end
end
