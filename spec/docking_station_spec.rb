require_relative "../lib/docking_station"
require_relative "../lib/bike"
describe DockingStation do
	let(:bike) {Bike.new}
	let(:station) {DockingStation.new(:capacity => 20)}

	it "should accecpt a bike" do
    expect { station.dock(bike) }.to change { station.bike_count}.from(0).to(1)
		#expect(station.bike_count).to eq(0)
		#expect(station.dock(bike))
		#expect(station.bike_count).to eq(1)
	end

  it "should know when it full" do
    expect(station).not_to be_full
    20.times { station.dock(Bike.new)}
    expect(station).to be_full
  end

  it "should not accept a bike if it's full" do
   20.times { station.dock(Bike.new) }
   expect(lambda { station.dock(bike) }).to raise_error(RuntimeError)
  end

  it "should provide a list of available bikes" do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break
    station.dock(working_bike)
    station.dock(broken_bike)
    expect(station.available_bikes).to eq([working_bike])
  end

end