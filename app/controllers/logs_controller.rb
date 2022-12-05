class LogsController < ApplicationController
  def new
    @log = Log.new
    @site = Site.find(params[:site_id])
    @plants = SitePlant.where(site_id: @site.id).where(planted: true)

  end

  def create
    @log = Log.new(log_params)
    @site = Site.find(params[:site_id])
    @log.site = @site
    if @log.save
      redirect_to site_path(@site)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @logs = Log.all
    @site = Site.find(params[:site_id])
  end

  def show
    @log = Log.find(params[:id])
    @site = Site.find(params[:site_id])
  end

  private

  def log_params
    params.require(:log).permit("date(1i)", "date(2i)", "date(3i)", :title, :description, :site_plant_id, photos: [])
  end
end
