require_relative 'bike_container'

class DockingStation
  include BikeContainer
  #DEFAULT_CAPACITY = 20

  def initialize(options = {})
    self.capacity = options.fetch(:capacity , capacity)
   # @bikes = []
  end

end
=begin
  def dock(bike)
    raise "Station is full" if full?
    @bikes << bike
  end

  def bike_count
    @bikes.count
  end

  def full?
    @bikes.count == @capacity
  end
  
  def fill_station(station)
    20.times {station.dock(Bike.new)}
  end

  def available_bikes
    @bikes.reject { |bike| bike.broken? }
  end

end
=end