class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def ui
  end

  def projDashboard
  end

  def nursury
    @site = Site.find(params[:site_id])
  end

  def search
    @plants = Plant.all
    @site = Site.find(params[:site_id])
  end
end
