class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home

  end

  def ui
  end

  def projDashboard
  end

  def my_sites_map
    @sites = Site.all
    @markers = @sites.geocoded.map do |site|
      {
        lat: site.latitude,
        lng: site.longitude,
        info_window: render_to_string(partial: "sites/info_window", locals: {site: site})
      }
    end
  end

  def nursury
    @site = Site.find(params[:site_id])
  end

  def search

    @plants = Plant.all
    # raise
    # if params[:n_fixer]
    #   @plants_n = Plant.where(n_fixer: true)
    # end

    # if params[:n_fixer]
    #   @plants_b = Plant.where(n_fixer: true)
    # end

    # @plants = @plants_b + @plants_n

    # @plants = @plants.uniq


    @site = Site.find(params[:site_id])
    lng = @site.longitude


  end
end
