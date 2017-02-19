require "rails_helper"

RSpec.describe Forecast, type: :model do
  context "methods" do
    let(:destination) { Destination.create(name:"Miami", zip:"33018", description: "Warm & Sunny", image_url: "google.com") }

    describe ".for_zip" do
      it "returns an array of the forecast days" do
        result = Forecast.for_zip(80218)

        expect(result).to be_a(Array)
        expect(result.count).to eq 10
      end
    end

    describe "#days" do
      it "an array of Day objects" do
        result = Forecast.new(80218).days

        expect(result).to be_a(Array)
        expect(result.all? { |day| day.class == Day }).to be true
        expect(result.count).to eq 10
      end
    end
  end
end
