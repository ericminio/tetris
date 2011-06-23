require "rspec"
require File.dirname(__FILE__) + '/../../../domain/piece'
require File.dirname(__FILE__) + '/../../../domain/pieces/bar'

describe "Bar" do

  before(:each) do
    @bar = Bar.new
  end

  it "is a piece" do
    @bar.should be_kind_of(Piece)
  end

  it "is made by 4 bricks" do
    @bar.bricks.size.should == 4
  end

  specify "will rotate around third brick" do
    @bar.bricks[0].line.should == 2
    @bar.bricks[0].column.should == 0

    @bar.bricks[1].line.should == 1
    @bar.bricks[1].column.should == 0

    @bar.bricks[2].line.should == 0
    @bar.bricks[2].column.should == 0

    @bar.bricks[3].line.should == -1
    @bar.bricks[3].column.should == 0
  end

end