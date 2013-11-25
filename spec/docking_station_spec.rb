require_relative "../lib/docking_station"
#require_relative "../lib/bike"

describe DockingStation do
	#let(:bike) {Bike.new}
	let(:station) {DockingStation.new(:capacity => 123)}

	it "should allow setting default capacity on initialising" do
    expect(station.capacity).to eq(123)
  end

end