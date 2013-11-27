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
      break if full?
      dock(bike)
      location.release(bike)
    end
  end

  def load_fixed_bikes_from(location)
    location.available_bikes.each do |bike|
      break if full?
      dock(bike)
      location.release(bike)
    end
  end

  def move_broken_bikes_to_fix(garage)
    #making copy of iter array cause otherwise it release itself by bit
    #or do loop like .array_length for iteration throug
    bikes.dup.each do |bike|
      break if garage.full?
      garage.accept(bike)
      release(bike)
    end
  end

  def move_fixed_bikes_to(station)
    bikes.dup.each do |bike|
      break if station.full?
      station.dock(bike)
      release(bike)
    end
  end


# def accept_fixed_bikes(garage)
  
end