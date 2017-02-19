class Api::V1::DestinationsController < ApplicationController
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
    render json: Destination.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

    def destination_params
      params.require(:destination).permit(:name, :description, :zip, :image_url)
    end
end
