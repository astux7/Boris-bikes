require_relative 'bike_container'

class Garage
  include BikeContainer
  
  def initialize(options={})
  	self.capacity = options.fetch(:capacity, capacity)
  	@bikes = []
  end

  def dock(bike)
    bike.fix
    super(bike)  #ask in inclued same name method
  end
  #if i am going to use alias need to uncomment method in container
  #alias_method :dock, :accept
end