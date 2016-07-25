class NrelService

  def initialize
    @_connection = Faraday.new("https://developer.nrel.gov")
  end

  def stations_by_zip(zip_code)
    response = connection.get("/api/alt-fuel-stations/v1/nearest.json", {:api_key => ENV["NRELAPIKEY"],
                                                                          :format => JSON,
                                                                          :location => zip_code,
                                                                          :raidus => 6.0,
                                                                          :fuel_type_code => ["ELEC", "LPG"],
                                                                          :limit => 10})
    parse(response)
  end

  def parse(response)
    JSON.parse(response.body)
  end

  private

  def connection
    @_connection
  end
end
