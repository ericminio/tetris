require File.dirname(__FILE__) + '/brick'

class Piece

  attr_reader :line, :column, :bricks, :relative, :hole

  def initialize(bricks)
    @bricks   = bricks
    @relative = {}
    bricks.each { |brick|
      @relative[brick] = Brick.new(:line=>brick.line, :column=>brick.column)
    }
  end

  def place_at(options={})
    @line   = options[:line]
    @column = options[:column]
    compute_bricks_locations()
  end

  def compute_bricks_locations
    @bricks.each { |brick|
      brick.line   = @relative[brick].line + @line
      brick.column = @relative[brick].column + @column
    }
  end

  def transform
    @hole.remove(self) if @hole
    yield
    at(:line=>@line, :column=>@column)
  end

  def move_right
    transform { @column += 1 }
  end

  def move_left
    transform { @column -= 1 }
  end

  def fall
    transform { @line -= 1 } if @hole==nil or @hole.can_fall?(self)
  end

  def rotate
    transform {
      @relative.each { |initial, brick|
        line         = brick.line
        brick.line   = brick.column
        brick.column = -line
      }
    }
  end

  def place_in(hole)
    @hole = hole
    self
  end

  def at(options={})
    place_at(options)
    @hole.hosts(self) if @hole
  end

end
