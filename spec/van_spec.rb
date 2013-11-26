require_relative "../lib/van"
require_relative "../lib/docking_station"
require_relative "../lib/bike"

describe Van do
  let(:van) {Van.new(:capacity => 5)}
  let(:station) {DockingStation.new(:capacity => 20)}
  let(:bike){Bike.new}
  
  it "should have own capacity" do
    expect(van.capacity).to eq(5)
  end
  it "should check the broken bikes in the station" do
  	working_bike, broken_bike = Bike.new, Bike.new
  	bikes = []
    broken_bike.break
    working_bike.fix
    station.dock(broken_bike)
    station.dock(working_bike)
    bikes << broken_bike 
    #bikes << working_bike
    expect(van.load_broken_bikes(station)).to eq(bikes)
  end


end