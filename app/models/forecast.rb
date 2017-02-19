class Forecast
  attr_reader :destination_zip

  def initialize(destination_zip)
    @destination_zip = destination_zip
  end

  def days
    DestinationService.forecast_10_day(destination_zip)
  end

  def self.for_zip(destination_zip)
    new(destination_zip).days
  end
end
