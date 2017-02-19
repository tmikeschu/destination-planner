class DestinationPresenter
  attr_reader :destination

  delegate :name,        to: :destination, prefix: true
  delegate :zip,         to: :destination, prefix: true
  delegate :description, to: :destination, prefix: true
  delegate :image_url,   to: :destination, prefix: true

  def initialize(destination)
    @destination = destination
  end

  def self.present(destination)
    new(destination)
  end

  def forecast_days
    # DestinationService.get_forecast_by_zip(destination_zip)
    Forecast.for_zip(destination_zip)
  end
end
