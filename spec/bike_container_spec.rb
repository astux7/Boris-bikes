require_relative '../lib/bike_container'
require_relative '../lib/person'
class ContainerHolder; include BikeContainer; end

describe BikeContainer do
  let(:bike) {Bike.new}
  let(:holder){ContainerHolder.new}
  let(:person){Person.new}

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

  it "should release a bike" do
    holder.dock(bike)
    holder.release(bike)
    expect(holder.bike_count).to eq(0)
  end
  
  it "should handle error of empty arg passing" do
    expect(holder.release()).to be_false
  end
  it "should handle and recognize not exist object" do
    first_bike, second_bike = Bike.new, Bike.new
    holder.dock(second_bike)
    expect(holder.release(first_bike)).to be_false
  end

  it "should handle string passing" do
    expect(holder.release(Object.new)).to be_false
  end
  it "should handle string and not exiting object" do
    expect(holder.dock()).to be_false
  end
  it "should handle string and not exiting object" do
    expect(holder.empty?).to be_true
  end

end