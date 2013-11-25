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

  it "should know when it full" do
    expect(station).not_to be_full
    20.times { station.dock(Bike.new)}
    expect(station).to be_full
  end

	

end