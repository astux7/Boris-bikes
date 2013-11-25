require_relative "../lib/docking_station"
describe DockingStation do
	let(:bike) {Bike.new}
	let(:station) {DockingStation.new}
	it "should accecpt a bike" do
		expect(station.bike_count).to eq(0)
		expect(station.dock(bike))
		expect(station.bike_count).to eq(1)
	end
	
end