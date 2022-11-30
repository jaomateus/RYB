class LogsController < ApplicationController
  def new
    @logs = Log.new
  end

  def create
    @log = Log.new(log_params)
    @log.site_id = @Site.find(params[:id])
    if @log.save
      redirect_to log_path(@log)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def log_params
    params.require(:log).permit(:date)
  end
end
