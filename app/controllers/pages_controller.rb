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
    # Filter

  if params == 1
    if params[:n_fixer]
      @plants_n_fixer = Plant.where(n_fixer: true)
    end
    @plants = @plants_n_fixer
  else
    # @plants = Plant.all
    @Plants = Plant.where()
  end

    # if params[:deciduous]
    #   @plants_deciduous = Plant.where(type: "deciduous").downcase
    # end

    # if params[:edible]
    #   # @plants_n = Plant.where(edibility_rate: true)
    # end

    # if params[:tree]
    #   @plants_n = Plant.where(n_fixer: true)
    # end

    # if params[:climber]
    #   @plants_n = Plant.where(n_fixer: true)
    # end

    # @plants = @plants_b + @plants_n

    # @plants_query = @plants.uniq


    @site = Site.find(params[:site_id])
    lng = @site.longitude
  end
end
