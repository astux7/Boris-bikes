module BikeContainer
  DEFAULT_CAPACITY = 10
  
   def capacity    
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)    
      @capacity = value.to_i > 0 ? value : DEFAULT_CAPACITY
  end

  def bikes
    @bikes ||= []
  end
#used to count capacity
  def bike_count
    bikes.count
  end
 
  def dock(bike = nil)
    return false if bike == nil
    raise "There is no more room for bikes" if full?
    bikes << bike
  end 

  def dock_all(bikes = nil)
    bikes.dup.each do |bike|
      dock(bike)
    end
  end

  def release(bike = nil)
    bikes.delete(bike) if bike != nil
    bikes.delete(bikes.last) if bike == nil
  end 

  def full?
    bike_count == capacity
  end

  def available_bikes
    bikes.reject { |bike| bike.broken?}
  end

  def broken_bikes
    bikes.select{ |bike| bike.broken?}
  end

 #def accept(bike)
    #bike.fix
  #  dock(bike)
  #end
  
  def accept_to(location,bike)
    location.dock(bike)
    release
  end

  def moving_from(location,bike)
    dock(bike)
    location.release(bike)
  end
  
  #def accept(bike)
  # bike.fix
  # return false if bike == nil
  # raise "There is no more room for bikes" if full?
  # bikes << bike
  #end

  def empty?
    bike_count == 0
  end

end