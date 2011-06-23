require "rspec"

require File.dirname(__FILE__) + '/../../domain/piece'
require File.dirname(__FILE__) + '/../../domain/brick'

describe "Piece" do

  describe "internal representation" do

    specify "keep bricks" do
      brick = Brick.new(:line=>1, :column=>2)
      piece = Piece.new([brick])
      piece.bricks.should == [brick]
    end

    specify "location sets relative positions of bricks" do
      brick = Brick.new(:line=>10, :column=>20)
      piece = Piece.new([brick])
      piece.place_at(:line=>2, :column=>3)

      bricks = piece.bricks
      bricks.size.should == 1
      bricks[0].should == brick
      bricks[0].line.should == 10 + 2
      bricks[0].column.should == 20 + 3
    end

  end

  def piece_at_origin_with_brick_at(options={})
    @piece = Piece.new([Brick.new(options)])
    @piece.place_at(:line=>0, :column=>0)
    @piece
  end

  describe "translations" do

    before(:each) do
      @piece = piece_at_origin_with_brick_at(:line=>10, :column=>20)
    end

    specify "moving right increments column" do
      @piece.move_right
      bricks = @piece.bricks
      bricks[0].line.should == 10
      bricks[0].column.should == 21
    end

    specify "moving left decreases column" do
      @piece.move_left
      bricks = @piece.bricks
      bricks[0].line.should == 10
      bricks[0].column.should == 19
    end

    specify "falling decreases line" do
      @piece.fall
      bricks = @piece.bricks
      bricks[0].line.should == 9
      bricks[0].column.should == 20
    end

  end


  describe "rotation" do

    specify "is around origin" do
      @piece = piece_at_origin_with_brick_at(:line=>0, :column=>0)
      @piece.rotate
      @piece.bricks[0].line.should == 0
      @piece.bricks[0].column.should == 0
    end

    specify "a brick on x axis arrives on y axis" do
      @piece = piece_at_origin_with_brick_at(:line=>0, :column=>1)
      @piece.rotate
      @piece.bricks[0].line.should == 1
      @piece.bricks[0].column.should == 0
    end

    specify "a brick on the y axis arrives on x axis" do
      @piece = piece_at_origin_with_brick_at(:line=>1, :column=>0)
      @piece.rotate
      @piece.bricks[0].line.should == 0
      @piece.bricks[0].column.should == -1
    end

  end

end