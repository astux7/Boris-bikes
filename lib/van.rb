require_relative 'bike_container'

class Van
  include BikeContainer
  def initialize(options={})
  	self.capacity = options.fetch(:capacity, capacity)
    @bikes = []
  end
 #if not taking first time need to run the other van 
  def load_broken_bikes_from(location)
    location.broken_bikes.each do |bike|
      full? ? break : moving_from(location,bike)
    end
  end

  def load_fixed_bikes_from(location)
    location.available_bikes.each do |bike|
      full? ? break : moving_from(location,bike)
    end
  end

  def move_broken_bikes_to_fix(garage)
    #making copy of iter array cause otherwise it release itself by bit
    #or do loop like .array_length for iteration throug
    bikes.dup.each do |bike|
      garage.full? ? break : accept_to(garage,bike)
    end
  end

  def move_fixed_bikes_to(station)
    bikes.dup.each do |bike|
      station.full? ? break : accept_to(station,bike)
    end
  end
end