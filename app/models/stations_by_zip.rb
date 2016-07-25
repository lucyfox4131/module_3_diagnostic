class StationsByZip

  def initialize
    @_nrel_conn = NrelService.new
  end

  def get_stations(zip_code)
    nrel_conn.stations_by_zip(zip_code)
  end

  private

  def nrel_conn
    @_nrel_conn
  end
end
