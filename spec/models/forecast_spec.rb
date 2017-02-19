require "rails_helper"

RSpec.describe Forecast, type: :model do
  context "methods" do
    let(:destination) { Destination.create(name:"Miami", zip:"33018", description: "Warm & Sunny", image_url: "google.com") }


  end
end
