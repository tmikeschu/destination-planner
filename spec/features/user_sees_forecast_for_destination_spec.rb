=begin
As a user
When I visit "/"
And I click on a destination
Then I should be on page "/destinations/:id"
Then I should see the destination's name, zipcode, description, and 10 day weather forecast
The weather forecast is specific to the destination whose page I'm on
The forecast should include date (weekday, month and day), high and low temps (F), and weather conditions
=end

require 'rails_helper'

RSpec.describe do
  context "Visitor" do
    describe "visits a destination page" do
      scenario "and sees the forecast for that destination" do
        VCR.use_cassette("forecast-10-day-80218") do
          destination = Destination.create(
            name:"Denver",
            zip:"80218",
            description: "Warm & Sunny",
            image_url: "google.com"
          )

          visit root_path
          click_on destination.name

          expect(current_path).to eq(destination_path(destination))
          expect(page).to have_content(destination.name)
          expect(page).to have_content(destination.zip)
          expect(page).to have_content(destination.description)
          expect(page).to have_selector('.day', count: 10)
          expect(page).to have_content("Monday")
          expect(page).to have_content("Tuesday")
          expect(page).to have_content("Wednesday")
          expect(page).to have_content("Thursday")
          expect(page).to have_content("Friday")
          expect(page).to have_content("Saturday")
          expect(page).to have_content("Sunday")
          expect(page).to have_content("Forecast for #{destination.name}")
          expect(page).to have_content("High (F): ")
          expect(page).to have_content("Low (F): ")
          expect(page).to have_content("Conditions: ")
        end
      end
    end
  end
end
