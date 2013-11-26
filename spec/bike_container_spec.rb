require_relative '../lib/bike_container'
class ContainerHolder; include BikeContainer; end

describe BikeContainer do
  let(:bike) {Bike.new}
  let(:holder){ContainerHolder.new}

  it "should accept a bike" do
    expect { holder.dock(bike) }.to change {holder.bike_count}.from(0).to(1)
  end

  it "should know when its full" do
    expect(holder).not_to be_full
    10.times {holder.dock(Bike.new)}
    expect(holder).to be_full
  end

  it "should not accept the bike if full" do 
    10.times {holder.dock(Bike.new)}
    expect(lambda { holder.dock(bike) }).to raise_error(RuntimeError)
  end

  it "should provide a list of available bikes" do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break
    holder.dock(working_bike)
    holder.dock(broken_bike)
    expect(holder.available_bikes).to eq([working_bike])
  end

  it "should fix the bike and return to dock" do
    broken_bike = Bike.new
    broken_bike.break
    holder.dock(broken_bike)
    holder.accept(broken_bike)
    expect(broken_bike.broken?).to be_false
  end 

end