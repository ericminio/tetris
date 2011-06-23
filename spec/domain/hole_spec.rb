require "rspec"
require File.dirname(__FILE__) + '/../../domain/hole'
require File.dirname(__FILE__) + '/../../domain/piece'

describe "Hole" do

  describe "content representation" do

    before(:each) do
      @hole = Hole.new(:lines=>3, :columns=>2)
    end

    specify "empty state" do
      @hole.lines.size.should == 4
      @hole.lines[3].should == [:wall, :empty, :empty, :wall]
      @hole.lines[2].should == [:wall, :empty, :empty, :wall]
      @hole.lines[1].should == [:wall, :empty, :empty, :wall]
      @hole.lines[0].should == [:wall, :wall,  :wall,  :wall]
    end

    specify "with a piece" do
      piece = Piece.new([Brick.new(:line=>0, :column=>0),
                         Brick.new(:line=>0, :column=>1)])
      piece.place_in(@hole).at(:line=>2, :column=>1)
      @hole.lines[3].should == [:wall, :empty, :empty, :wall]
      @hole.lines[2].should == [:wall,  piece,  piece, :wall]
      @hole.lines[1].should == [:wall, :empty, :empty, :wall]
      @hole.lines[0].should == [:wall, :wall,  :wall,  :wall]
    end

    specify "removing a piece" do
      piece = Piece.new([Brick.new(:line=>0, :column=>0),
                         Brick.new(:line=>0, :column=>1)])
      piece.place_in(@hole).at(:line=>2, :column=>1)
      @hole.remove(piece)
      @hole.lines[3].should == [:wall, :empty, :empty, :wall]
      @hole.lines[2].should == [:wall, :empty, :empty, :wall]
      @hole.lines[1].should == [:wall, :empty, :empty, :wall]
      @hole.lines[0].should == [:wall, :wall,  :wall,  :wall]
    end

  end


end