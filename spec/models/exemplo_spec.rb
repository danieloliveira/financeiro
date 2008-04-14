require File.dirname(__FILE__) + '/../spec_helper'

describe Exemplo do
  before(:each) do
    @exemplo = Exemplo.new
  end

  it "should be valid" do
    @exemplo.should be_valid
  end
end
