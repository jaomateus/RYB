class LogsController < ApplicationController
  def new
    @log = Log.new
    @site = Site.find(params[:site_id])
  end

  def create
    @log = Log.new(log_params)
    @site = Site.find(params[:site_id])
    @log.site = @site
    if @log.save
      redirect_to site_log_path(@log.site, @log)
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
    params.require(:log).permit("date(1i)", "date(2i)", "date(3i)", :title, :description, :photo)
  end
end
