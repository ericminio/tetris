class Brick

  attr_accessor :line, :column

  def initialize(options = {})
    @line = options[:line]
    @column = options[:column]
  end


end


