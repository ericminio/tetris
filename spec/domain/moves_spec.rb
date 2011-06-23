require "rspec"
require File.dirname(__FILE__) + '/../../domain/hole'
require File.dirname(__FILE__) + '/../../domain/piece'

describe "Moves" do

  before(:each) do
    @hole = Hole.new(:lines=>3, :columns=>2)
  end

  specify "rotation" do
    piece = Piece.new([Brick.new(:line=>0, :column=>0),
                       Brick.new(:line=>0, :column=>1)])
    piece.place_in(@hole).at(:line=>2, :column=>1)
    piece.rotate
    @hole.lines[3].should == [:wall, piece, :empty, :wall]
    @hole.lines[2].should == [:wall, piece, :empty, :wall]
    @hole.lines[1].should == [:wall, :empty, :empty, :wall]
    @hole.lines[0].should == [:wall, :wall, :wall, :wall]
  end

  specify "fall" do
    piece = Piece.new([Brick.new(:line=>0, :column=>0),
                       Brick.new(:line=>1, :column=>0)])
    piece.place_in(@hole).at(:line=>2, :column=>1)
    piece.fall
    @hole.lines[3].should == [:wall, :empty, :empty, :wall]
    @hole.lines[2].should == [:wall, piece, :empty, :wall]
    @hole.lines[1].should == [:wall, piece, :empty, :wall]
    @hole.lines[0].should == [:wall, :wall, :wall, :wall]
  end

  specify "move right" do
    piece = Piece.new([Brick.new(:line=>0, :column=>0),
                       Brick.new(:line=>1, :column=>0)])
    piece.place_in(@hole).at(:line=>2, :column=>1)
    piece.move_right
    @hole.lines[3].should == [:wall, :empty, piece, :wall]
    @hole.lines[2].should == [:wall, :empty, piece, :wall]
    @hole.lines[1].should == [:wall, :empty, :empty, :wall]
    @hole.lines[0].should == [:wall, :wall, :wall, :wall]
  end

  specify "move left" do
    piece = Piece.new([Brick.new(:line=>0, :column=>0),
                       Brick.new(:line=>1, :column=>0)])
    piece.place_in(@hole).at(:line=>2, :column=>2)
    piece.move_left
    @hole.lines[3].should == [:wall, piece, :empty, :wall]
    @hole.lines[2].should == [:wall, piece, :empty, :wall]
    @hole.lines[1].should == [:wall, :empty, :empty, :wall]
    @hole.lines[0].should == [:wall, :wall, :wall, :wall]
  end

end