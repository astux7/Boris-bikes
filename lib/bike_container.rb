module BikeContainer
  DEFAULT_CAPACITY = 10
  
   def capacity    
    @capacity ||= DEFAULT_CAPACITY
  end

  def capacity=(value)    
    @capacity = value
  end

  def bikes
    @bikes ||= []
  end

  def bike_count
    bikes.count
  end
 
  def dock(bike = nil)
    return false if bike == nil
    return false if bikes.find{|bike_in| bike_in.object_id == bike.object_id} != nil
    raise "There is no more room for bikes" if full?
    bikes << bike
  end 

  def release(bike = nil)
    return false if bike == nil 
    return false if bikes.find{|bike_in| bike_in.object_id == bike.object_id} == nil
    bikes.delete(bike)
  end

  def full?
    bike_count == capacity
  end

  def available_bikes
    bikes.reject { |bike| bike.broken?}
  end

  def broken_bikes
    bikes.reject{ |bike| !bike.broken?}

  end

  def accept(bike)
    bike.fix
    dock(bike)
  end

  def empty?
    return true if bike_count == 0
  end

end