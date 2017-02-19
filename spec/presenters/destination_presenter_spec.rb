require "rails_helper"

RSpec.describe DestinationPresenter, type: :model do
  context "methods" do
    let(:destination) { Destination.create(name:"Miami", zip:"33018", description: "Warm & Sunny", image_url: "google.com") }
    let(:presenter)   { DestinationPresenter.present(destination) }

    describe ".present" do
      it "returns a presenter instance with destination attributes" do

        expect(presenter).to respond_to(:destination_name)
        expect(presenter).to respond_to(:destination_zip)
        expect(presenter).to respond_to(:destination_description)
        expect(presenter).to respond_to(:destination_image_url)
        expect(presenter).to respond_to(:forecast_days)
      end
    end

    describe "#forecast_days" do
      it "returns an array of 10 forecasts" do
        # expect(thing).to be_a(Destination::Array)

      end
    end
  end
end
