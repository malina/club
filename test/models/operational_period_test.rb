require "test_helper"

describe Caterer::OperationalPeriod do
  before do
    @operational_period = Caterer::OperationalPeriod.new
  end

  it "must be valid" do
    @operational_period.valid?.must_equal true
  end
end
