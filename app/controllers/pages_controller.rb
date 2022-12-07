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
    @plants = Plant.all

    if params.keys.count > 3

      @plants = []

      if params[:n_fixer]
        @plants += Plant.where(n_fixer: true)
      end

      if params[:tree]
        @plants += Plant.where(plant_type: "tree")
      end

      if params[:shrub]
        @plants += Plant.where(plant_type: "shrub")
      end
      # raise
      if params[:climber]
        @plants += Plant.where(plant_type: "climber")
      end

      if params[:perennial]
        @plants += Plant.where(plant_type: "perennial")
      end


      @plants = @plants.uniq
    end



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
    # lng = @site.longitude
  end
end
