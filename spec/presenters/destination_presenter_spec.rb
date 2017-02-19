require "rails_helper"

RSpec.describe DestinationPresenter, type: :model do
  context "methods" do
    describe ".present" do
      it "returns a presenter instance with destination attributes" do
        destination = Destination.create(
          name:"Miami",
          zip:"33018",
          description: "Warm & Sunny",
          image_url: "google.com"
        )
        presenter = DestinationPresenter.present()
      end
    end
  end
end
