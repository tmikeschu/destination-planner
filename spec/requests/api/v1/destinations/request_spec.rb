require "rails_helper"

RSpec.describe "Destinations API endpoints", type: :request do
  before do
    @destination1 = Destination.create(name:"Miami", zip:"80218", description: "Warm & Sunny", image_url: "google.com")
    @destination2 = Destination.create(name:"Miami", zip:"64110", description: "Warm & Sunny", image_url: "google.com")
    @destination3 = Destination.create(name:"Miami", zip:"90210", description: "Warm & Sunny", image_url: "google.com")
  end

  it "return all destinations" do
    get "/api/v1/destinations"

    expect(response).to be_success
    json_destinations = JSON.parse(response.body, symbolize_names: true)
    destination = json_destinations.first

    expect(json_destinations.count).to eq 3
    expect(destination).to have_key(:name)
    expect(destination).to have_key(:zip)
    expect(destination).to have_key(:description)
    expect(destination).to have_key(:image_url)
  end

  it "create a destinations" do
    params = { name:"Denver", zip:"80218", description: "Warm & Sunny", image_url: "google.com"}
    post api_v1_destinations_path, params: { destination: params }

    expect(response).to be_success

    destination = JSON.parse(response.body, symbolize_names: true)

    expect(destination[:name]).to eq "Denver"
    expect(destination).to have_key(:name)
    expect(destination).to have_key(:zip)
    expect(destination).to have_key(:description)
    expect(destination).to have_key(:image_url)
  end

  it "shows a destination" do
    get api_v1_destination_path(@destination1)

    expect(response).to be_success
    destination = JSON.parse(response.body, symbolize_names: true)

    expect(destination[:name]).to eq @destination1.name
    expect(destination[:zip]).to eq @destination1.zip
    expect(destination[:description]).to eq @destination1.description
    expect(destination[:image_url]).to eq @destination1.image_url
    expect(destination).to have_key(:zip)
    expect(destination).to have_key(:description)
    expect(destination).to have_key(:image_url)
  end

  it "updates a single destination" do
    params = { name:"Denver", zip:"80218", description: "Warm & Sunny", image_url: "google.com"}
    put api_v1_destination_path(@destination1), params: { destination: params }

    expect(response).to be_success

    destination = JSON.parse(response.body, symbolize_names: true)
    @destination1.reload

    expect(@destination1.name).to eq "Denver"
    expect(destination[:name]).to eq "Denver"
  end

  it "deletes a destination" do
    expect(Destination.count).to eq 3

    delete api_v1_destination_path(@destination1)

    expect(Destination.count).to eq 2
    expect(response).to be_success
  end
end
