class DockingStation

  DEFAULT_CAPACITY = 20

	def initialize(options = {})
    @capacity = options.fetch(:capacity) || DEFAULT_CAPACITY
		@bikes = []
	end

	def dock(bike)
    rise "Station is full" if full?
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
end