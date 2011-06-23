require "rspec"
require File.dirname(__FILE__) + '/../../domain/hole'
require File.dirname(__FILE__) + '/../../domain/piece'

describe "Detect collisions" do

  before(:each) do
    @hole = Hole.new(:lines=>3, :columns=>2)
  end

  describe "when falling" do

    specify "with the wall" do
      piece = Piece.new([Brick.new(:line=>0, :column=>0)])
      piece.place_in(@hole).at(:line=>1, :column=>1)
      @hole.can_fall?(piece).should be_false
      piece.fall
      piece.line.should == 1
    end

    specify "with another piece" do
      another_piece = Piece.new([Brick.new(:line=>0, :column=>0)])
      another_piece.place_in(@hole).at(:line=>1, :column=>1)
      piece = Piece.new([Brick.new(:line=>0, :column=>0)])
      piece.place_in(@hole).at(:line=>2, :column=>1)
      @hole.can_fall?(piece).should be_false
    end

    it "works with a bigger piece" do
      piece = Piece.new([Brick.new(:line=>0, :column=>0),
                         Brick.new(:line=>1, :column=>0)])
      piece.place_in(@hole).at(:line=>2, :column=>1)
      @hole.can_fall?(piece).should be_true
    end

  end

  describe "when rotating" do

    before(:each) do
      @piece = Piece.new([Brick.new(:line=>0, :column=>0),
                          Brick.new(:line=>1, :column=>0)])
    end

    specify "can rotate when it won't intersect the wall" do
      @piece.place_in(@hole).at(:line=>2, :column=>2)
      @hole.can_rotate?(@piece).should be_true
    end

    specify "can not rotate if it would intersect the wall" do
      @piece.place_in(@hole).at(:line=>2, :column=>1)
      @hole.can_rotate?(@piece).should be_false
    end

  end

  describe "when moving left" do

    before(:each) do
      @piece = Piece.new([Brick.new(:line=>0, :column=>0),
                          Brick.new(:line=>1, :column=>0)])
    end

    specify "can move when far from the wall" do
      @piece.place_in(@hole).at(:line=>2, :column=>2)
      @hole.can_move_left?(@piece).should be_true
    end

    specify "can not move when next to the wall" do
      @piece.place_in(@hole).at(:line=>2, :column=>1)
      @hole.can_move_left?(@piece).should be_false
    end

  end

  describe "when moving right" do

    before(:each) do
      @piece = Piece.new([Brick.new(:line=>0, :column=>0),
                          Brick.new(:line=>1, :column=>0)])
    end

    specify "can move when far from the wall" do
      @piece.place_in(@hole).at(:line=>2, :column=>1)
      @hole.can_move_right?(@piece).should be_true
    end

    specify "can not move when next to the wall" do
      @piece.place_in(@hole).at(:line=>2, :column=>2)
      @hole.can_move_right?(@piece).should be_false
    end

  end


end