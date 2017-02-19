require "rails_helper"

RSpec.describe DestinationService do
  context "methods" do
    describe ".forecast_10_day" do
      it "returns an array of 10 day objects" do
        result = DestinationService.forecast_10_day(80218)

        expect(result).to be_a(Array)
        expect(result.all? { |day| day.class == Day }).to be true
        expect(result.count).to eq 10
      end
    end
  end
end
