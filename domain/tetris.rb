require File.dirname(__FILE__) + '/hole'
require File.dirname(__FILE__) + '/pieces/bar'

class Tetris

  attr_reader :hole, :controlled_piece
  attr_accessor :view
  attr_accessor :speed

  def initialize
    @hole             = Hole.new(:lines=>22, :columns=>10)
    @controlled_piece = Bar.new
    @controlled_piece.place_in(@hole).at(:line=>20, :column=>5)
    @speed = 0.5
  end

  def update_view
    @view.show(@hole) if @view
  end

  def fall
    @controlled_piece.fall 
    update_view()
  end

  def start
    update_view()
    @thread = Thread.new {
      while true do
        sleep(@speed)
        fall()
      end
    }
  end

end