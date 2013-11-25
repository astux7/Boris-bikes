require_relative '../lib/bike.rb'
describe Bike do
  let(:bike){Bike.new}
  it "should not be broken after we create it" do
    #expect(bike).not_to be_broken
    expect(bike.broken?).to be_false
  end	

end