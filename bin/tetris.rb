require File.dirname(__FILE__) + '/../domain/tetris'
require File.dirname(__FILE__) + '/../gui/console/console'

tetris = Tetris.new
tetris.view = Console.new
tetris.start

while true do
  sleep(1000)
end