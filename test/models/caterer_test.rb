require "test_helper"

describe Caterer do
  before do
    @caterer = Caterer.new(name: 'San Pedro', response_time: 10)
  end

  it "must be valid" do
    @caterer.valid?.must_equal true
  end
end
