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

      if params[:part_shade]
        @plants += Plant.where(plant_type: "part_shade")
      end

      if params[:deciduous]
        @plants += Plant.where(plant_type: "Deciduous")
      end

      if params[:edible]
        @plants += Plant.where(plant_type: "Evergreen")
      end

      if params[:ground_cover]
        @plants += Plant.where(plant_type: "ground_cover")
      end

      if params[:well_drained]
        @plants += Plant.where(plant_type: "well_drained")
      end

      if params[:moist]
        @plants += Plant.where(plant_type: "moist")
      end

      if params[:wet_soil]
        @plants += Plant.where(wet_soil: true)
      end

      if params[:full_sun]
        @plants += Plant.where(plant_type: "full_sun")
      end

      if params[:partial_shade]
        @plants += Plant.where(plant_type: "partial_shade")
      end

      if params[:full_shade]
        @plants += Plant.where(plant_type: "full_shade")
      end

      if params[:nitrogen_fixer]
        @plants += Plant.where(plant_type: "nitrogen_fixer")
      end

      if params[:wind_protection]
        @plants += Plant.where(plant_type: "wind_protection")
      end

      if params[:soil_stabilization]
        @plants += Plant.where(plant_type: "soil_stabilization")
      end

      if params[:full_shade]
        @plants += Plant.where(plant_type: "water filtration")
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
