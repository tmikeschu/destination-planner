class Api::V1::DestinationsController < ApplicationController
  before_action :set_destination, except: [:index, :create]

  def index
    render json: Destination.all
  end

  def create
    destination = Destination.new(destination_params)
    if destination.save!
      render json: destination
    else
    end
  end

  def show
    render json: @destination
  end

  def update
    if @destination.update(destination_params)
      render json: @destination
    end
  end

  def destroy
    @destination.destroy
    respond_to do |format|
      format.json { head :no_content}
    end
  end

  private

    def destination_params
      params.require(:destination).permit(:name, :description, :zip, :image_url)
    end

    def set_destination
      @destination = Destination.find(params[:id])
    end
end
