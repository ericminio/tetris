require "rspec"

require File.dirname(__FILE__) + '/../../domain/brick'

describe "Brick" do

  before(:each) do
    @brick = Brick.new(:line=>1, :column=>2)
  end

  specify "given position is stored" do
    @brick.line.should == 1
    @brick.column.should == 2
  end


end