class DestinationService
  def initialize(destination_zip)
    @zip = destination_zip
  end

  def self.forecast_10_day(destination_zip)
    new(destination_zip).days
  end

  def connection
    @conn ||= Faraday.new("http://api.wunderground.com/api/")
  end

  def response
    connection.get(default_api_path).body
  end

  def default_api_path
    "#{ENV["WUNDERGROUND_KEY"]}/forecast10day/q/#{@zip}"
  end

  def json_days
    JSON.parse(response, symbolize_names: true)
  end

  def days
    json_days.map { |day| Day.new(day) }
  end
end
