class Hole

  attr_accessor :lines

  def initialize(options = {})
    line_number   = options[:lines]
    column_number = options[:columns]
    fills_with_empty(column_number, line_number)
    set_walls(column_number, line_number)
    set_bottom(column_number)
  end

  def hosts(piece)
    piece.bricks.each { |brick|
      @lines[brick.line][brick.column] = piece
    }
  end

  def remove(piece)
    piece.bricks.each { |brick|
      @lines[brick.line][brick.column] = :empty
    }
  end

  def can_fall?(piece)
    can_move_bricks?(piece) { |piece, brick| below(brick) }
  end

  def can_rotate?(piece)
    can_move_bricks?(piece) { |piece, brick| earlier(brick, piece) }
  end

  def can_move_left?(piece)
    can_move_bricks?(piece) { |piece, brick| left(brick) }
  end

  def can_move_right?(piece)
    can_move_bricks?(piece) { |piece, brick| right(brick) }
  end


  def set_walls(column_number, line_number)
    (1..line_number).each { |i|
      @lines[i][0]                 = :wall
      @lines[i][column_number + 1] = :wall
    }
  end

  def set_bottom(column_number)
    @lines[0] = Array.new(column_number + 2).fill(:wall)
  end

  def fills_with_empty(column_number, line_number)
    @lines = Array.new(line_number + 1).fill { |i|
      Array.new(column_number + 2).fill(:empty)
    }
  end


  def can_move_bricks?(piece)
    is_free = true
    piece.bricks.each { |brick|
      target = yield(piece, brick)
      is_free = false if !(target == :empty || target == piece)
    }
    is_free
  end

  def below(brick)
    @lines[brick.line-1][brick.column]
  end

  def left(brick)
    @lines[brick.line][brick.column-1]
  end

  def right(brick)
    @lines[brick.line][brick.column+1]
  end

  def earlier(brick, piece)
    @lines[piece.line + brick.column - piece.column][piece.column + piece.line - brick.line]
  end

end
