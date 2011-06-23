require "rspec"
require File.dirname(__FILE__) + '/../../domain/tetris'
require File.dirname(__FILE__) + '/../../domain/pieces/bar'

describe "Tetris" do

  before(:each) do
    @tetris = Tetris.new
  end

  describe "Hole" do

    it "has a hole" do
      @tetris.hole.should_not be_nil
    end

    specify "hole has 22 lines plus 1 for the bottom" do
      @tetris.hole.lines.size.should == 22 + 1
    end

    specify "hole has 10 columns plus 2 surrounding walls" do
      @tetris.hole.lines.each { |line| line.size.should == 10 + 2 }
    end

  end

  describe "First piece" do

    it "is a bar" do
      @tetris.controlled_piece.should be_instance_of(Bar)
    end

    it "is in the hole" do
      @tetris.controlled_piece.hole.should == @tetris.hole
    end

    specify "location" do
      @tetris.controlled_piece.line.should == 20
      @tetris.controlled_piece.column.should == 5
    end

  end

  describe "View" do

    specify "a view can be set" do
      @tetris.view = double()
    end

    specify "view shows the hole at start" do
      @tetris.view = double()
      @tetris.view.should_receive(:show).with(@tetris.hole)
      @tetris.start
    end

    it "supports not having any view" do
      @tetris.start
    end

    specify "view is updated when the controlled piece falls" do
      @tetris.view = double()
      @tetris.view.should_receive(:show).with(@tetris.hole)
      @tetris.fall
    end

  end

  describe "Speed" do

    specify "speed is adequate to play" do
      @tetris.speed.should == 0.5
    end

    specify "controlled piece is falling" do
      recorded_position = @tetris.controlled_piece.line
      @tetris.speed = 0.01
      @tetris.start
      sleep(0.05)
      @tetris.controlled_piece.line.should < recorded_position
    end

  end

  describe "User input" do

    it "must be considered" do
      false.should be_true
    end

  end

end