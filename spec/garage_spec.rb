require_relative "../lib/garage"

describe Garage do
  let(:garage) {Garage.new(:capacity => 14)}
  let(:bike){double(:bike,:"broken?"=>true,:fix=>"")}
  
  it "should have own capacity" do
    expect(garage.capacity).to eq(14)
  end

  it "should dock a bike" do
    expect { garage.dock(bike) }.to change {garage.bike_count}.from(0).to(1)
  end

  it "should fix a bike when docked" do
  	expect(bike).to receive(:fix)
  	garage.dock(bike)
  end
end