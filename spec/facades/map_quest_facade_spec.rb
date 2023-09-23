require "rails_helper"

RSpec.describe MapQuestFacade do
  describe "class methods" do
    it "#get_lat_long" do
      location = "denver,co"
      search = MapQuestFacade.new.get_lat_long(location)

      expect(search).to be_a(Hash)
      expect(search).to have_key(:results)
      expect(search[:results]).to be_an(Array)
      expect(search[:results][0]).to be_a(Hash)
      expect(search[:results][0]).to have_key(:locations)
      expect(search[:results][0][:locations]).to be_an(Array)
      expect(search[:results][0][:locations][0]).to be_a(Hash)
      expect(search[:results][0][:locations][0]).to have_key(:latLng)
      expect(search[:results][0][:locations][0][:latLng]).to be_a(Hash)
      expect(search[:results][0][:locations][0][:latLng]).to have_key(:lat)
      expect(search[:results][0][:locations][0][:latLng][:lat]).to be_a(Float)
      expect(search[:results][0][:locations][0][:latLng]).to have_key(:lng)
      expect(search[:results][0][:locations][0][:latLng][:lng]).to be_a(Float)
    end
  end
end