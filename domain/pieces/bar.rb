require File.dirname(__FILE__) + '/../piece'
require File.dirname(__FILE__) + '/../brick'

class Bar < Piece

  def initialize
    super([Brick.new(:line=>2, :column=>0),
           Brick.new(:line=>1, :column=>0),
           Brick.new(:line=>0, :column=>0),
           Brick.new(:line=>-1,:column=>0)])
  end

end