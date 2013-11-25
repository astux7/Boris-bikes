class DockingStation
	def initialize
		@bikes = []
	end

	def dock(bike)
		@bikes << bike
	end

	def bike_count
		@bikes.count
	end
end