require_relative "../lib/docking_station"
require_relative "../lib/bike"
describe DockingStation do
	let(:bike) {Bike.new}
	let(:station) {DockingStation.new(:capacity => 20)}
	it "should accecpt a bike" do
		expect(station.bike_count).to eq(0)
		expect(station.dock(bike))
		expect(station.bike_count).to eq(1)
	end

  
  
  it "should not accept a bike if it's full" do
   20.times { station.dock(Bike.new) }
   expect(lambda { station.dock(bike) }).to raise_error(RuntimeError)
  end

end