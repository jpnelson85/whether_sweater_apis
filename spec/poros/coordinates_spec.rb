require "rails_helper"

RSpec.describe "Coordinates Poro" do
  describe "#coordinates" do
    it "has attributes" do
      coordinates_data = Coordinates.new({ "results": [ { "locations": [ { "latLng": { "lat": 39.738453, "lng": -104.984853 } } ] } ] })
          
      expect(coordinates_data).to be_a(Coordinates)
      expect(coordinates_data.latitude).to be_a(Float)
      expect(coordinates_data.longitude).to be_a(Float)
    end
  end
end