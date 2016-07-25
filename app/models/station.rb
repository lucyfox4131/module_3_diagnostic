class Station < OpenStruct

  def initialize
    @_nrel_conn ||= NrelService.new
  end

  def get_stations(zip_code)
    stations = nrel_conn.stations_by_zip(zip_code)
    create_stations(stations['fuel_stations'])
  end

  def create_stations(stations)
    stations.each do |station|
      Station.new(station)
    end
  end

  private

  def nrel_conn
    @_nrel_conn
  end
end
