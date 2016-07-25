class SearchController < ApplicationController

  def index
    @stations = StationsByZip.new.get_stations(params['q'])
  end
end
