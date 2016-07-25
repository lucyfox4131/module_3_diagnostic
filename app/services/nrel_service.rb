class NrelService

  def initialize
    @_connection = Faraday.new("https://developer.nrel.gov")
  end

  def stations_by_zip(zip_code)
    connection.get("/api/alt-fuel-stations/v1/nearest.json")
  end

  private

  def connection
    @_connection
  end
end
