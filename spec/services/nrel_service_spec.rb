require 'rails_helper'

describe NrelService do
  it 'returns 10 stations within six miles based on zip' do
    VCR.use_cassette("zip_locator") do
      search = NrelService.new
      stations = search.stations_by_zip(80203)

      expect(stations.count).to eq(10)
    end
  end
end
