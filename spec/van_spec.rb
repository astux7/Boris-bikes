require_relative "../lib/van"
require_relative "../lib/docking_station"
require_relative "../lib/bike"
require_relative "../lib/garage"

describe Van do
  let(:van) {Van.new(:capacity => 2)}
  let(:station) {DockingStation.new(:capacity => 20)}
  let(:bike){Bike.new}
  let(:garage){Garage.new(:capacity => 5)}
  
  it "should have own capacity" do
    expect(van.capacity).to eq(2)
  end

  it "should care about capacity " do
    working_bike, broken_bike , bike1 , bike2 = Bike.new, Bike.new, Bike.new, Bike.new
    bikes = []
    broken_bike.break
    working_bike.break
    bike2.break
    bike1.break
    station.dock(broken_bike)
    station.dock(working_bike)
    station.dock(bike1)
    station.dock(bike2)
    bikes << broken_bike 
    bikes << working_bike
    bikes << bike2
    bikes << bike1
    van.load_broken_bikes_from(station)
    van.bikes.count.should be >= (van.capacity)
    #need to see how is greater then
  end

  it "should take broken bikes in the station (left some if full)" do
  	working_bike, broken_bike , extra_bike = Bike.new, Bike.new, Bike.new
  	bikes = []
    broken_bike.break
    working_bike.break
    extra_bike.break
    station.dock(broken_bike)
    station.dock(working_bike)
    station.dock(extra_bike)
    bikes << broken_bike 
    bikes << working_bike
    bikes << extra_bike
    van.load_broken_bikes_from(station)
    #expect(van.bikes).to eq(bikes)
    expect(station.bikes.include? broken_bike).to be_false
    #cause van is full it left some of them in station too
    expect(station.broken_bikes.include? extra_bike).to be_true
    expect(van.bike_count).to eq(2)
  end

  it "should delivery bikes to garage" do
    working_bike, broken_bike , extra_bike = Bike.new, Bike.new, Bike.new
    bikes = []
    broken_bike.break
    working_bike.break
    extra_bike.break
    station.dock(broken_bike)
    station.dock(working_bike)
  #  station.dock(extra_bike)
    bikes << broken_bike 
    bikes << working_bike
    #bikes << extra_bike
    van.load_broken_bikes_from(station)
    van.move_broken_bikes_to_fix(garage)
    expect(van.bike_count).to eq(0)
    expect(garage.bike_count).to eq(2)
    #cause van is full it left some of them in station too
  end

  it "should fixed bikes to load from garage" do
    working_bike, broken_bike , extra_bike = Bike.new, Bike.new, Bike.new
    bikes = []
    broken_bike.break
    working_bike.break
    extra_bike.break
    station.dock(broken_bike)
    station.dock(working_bike)
  #  station.dock(extra_bike)
    bikes << broken_bike 
    bikes << working_bike
    #bikes << extra_bike
    van.load_broken_bikes_from(station)
    van.move_broken_bikes_to_fix(garage)
    van.load_fixed_bikes_from(garage)
    expect(garage.bike_count).to eq(0)
    expect(van.bike_count).to eq(2)
  end

  it "should fixed bikes to return to station" do
    working_bike, broken_bike , extra_bike = Bike.new, Bike.new, Bike.new
    bikes = []
    broken_bike.break
    working_bike.break
    extra_bike.break
    station.dock(broken_bike)
    station.dock(working_bike)
  #  station.dock(extra_bike)
    bikes << broken_bike 
    bikes << working_bike
    #bikes << extra_bike
    van.load_broken_bikes_from(station)
    van.move_broken_bikes_to_fix(garage)
    van.load_fixed_bikes_from(garage)
    van.move_fixed_bikes_to(station)
    expect(van.bike_count).to eq(0)
    expect(station.bike_count).to eq(2)
  end

  it "should manage negative and bad type of capacity" do
    vann = Van.new({:capacity => -55})
    expect(vann.capacity).to eq(10)
  end

end