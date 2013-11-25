require_relative "../lib/garage"

describe Garage do
  let(:garage) {Garage.new(:capacity => 14)}
  
  it "should have own capacity" do
    expect(garage.capacity).to eq(14)
  end
end