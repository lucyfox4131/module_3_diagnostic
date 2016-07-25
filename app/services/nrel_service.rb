class NrelService

  def initialize
    @_connection = Faraday.new("https://developer.nrel.gov")
  end
end
