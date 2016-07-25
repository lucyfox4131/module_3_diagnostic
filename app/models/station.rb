class Station < OpenStruct

  def get_connection
    @_nrel_conn ||= NrelService.new
  end

  def get_stations(zip_code)
    get_connection
    stations = nrel_conn.stations_by_zip(zip_code)
    create_stations(stations['fuel_stations'])
  end

  def create_stations(stations)
    stations.map do |station|
      Station.new(station)
    end
  end

  def address
    "#{self.street_address}, #{self.city}, #{self.state}, #{self.zip}"
  end

  def fuel_types
    self.fuel_type_code
  end

  private

  def nrel_conn
    @_nrel_conn
  end
end
