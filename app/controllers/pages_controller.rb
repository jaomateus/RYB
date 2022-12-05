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
    @site = Site.find(params[:site_id])
  end
end
