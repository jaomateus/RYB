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
    @site.save
  end

  private

    def site_params
      params.require(:site).permit(:project_name, :description, :address, :project_type, :project_area)
    end

end
