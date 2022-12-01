class SitesController < ApplicationController
  def index
    @sites = Site.all
  end

  def new
    @site = Site.new
  end

  def create
    @site = Site.new(site_params)
    @site.user = current_user
    if @site.save
      redirect_to site_path(@site)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @site = Site.find(params[:id])
  end

  def edit
    @site = Site.find(params[:id])
  end

  def update
    @site = Site.find(params[:id])

    if @site.update(site_params)
      redirect_to site_path(@site)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @site = Site.find(params[:id])
    @site.destroy

    redirect_to root_path
  end

  private

  def site_params
    params.require(:site).permit(:project_name, :description, :address, :project_type, :project_area)
  end
end
