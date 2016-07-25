class NrelService

  def initialize(api_key)
    @_connection = Faraday.new("https://developer.nrel.gov")
    @_api_key = api_key
  end

  def stations_by_zip(zip_code)
    response = connection.get("/api/alt-fuel-stations/v1/nearest.json"), {:api_key => ENV["NRELAPIKEY"],
                                                                          :format => JSON,
                                                                          :zip => zip_code,
                                                                          :raidus => "6.0",
                                                                          :fuel_type => ["ELEC", "LPG"],
                                                                          :limit => 10}
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
