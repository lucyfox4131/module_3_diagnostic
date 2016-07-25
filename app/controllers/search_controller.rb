class SearchController < ApplicationController

  def index
    @stations = Station.new.get_stations(params['q'])
  end
end
