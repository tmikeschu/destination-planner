require "rails_helper"

RSpec.describe Day do
  describe "attributes" do
    it "include" do
      raw_days  = File.read("./spec/fixtures/80218-10-days.json")
      json_days = JSON.parse(raw_days, symbolize_names: true)[:key]
      day = Day.new(json_days.first)

      expect(day).to respond_to(:date)
      expect(day).to respond_to(:high_temp)
      expect(day).to respond_to(:low_temp)
      expect(day).to respond_to(:conditions)
    end
  end
end
