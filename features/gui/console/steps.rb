require 'rspec'
require File.dirname(__FILE__) + '/../../../gui/console/console'
require File.dirname(__FILE__) + '/../../../domain/hole'
require File.dirname(__FILE__) + '/../../../domain/piece'
require File.dirname(__FILE__) + '/../../../domain/brick'


Given /^a hole with (\d+) lines and (\d+) columns/ do |line, column|
  @hole = Hole.new(:lines=>line.to_i, :columns=>column.to_i)
end

When /^the hole is empty$/ do
end

When /^there is a brick at line (\d+) and column (\d+)$/ do |line, column|
  piece = Piece.new([Brick.new(:line=>0, :column=>0)])
  piece.place_in(@hole).at(:line=>line.to_i, :column=>column.to_i)
end

Then /^I see it as$/ do |view|
  $stdout = replace_stdout()
  console = Console.new
  console.show(@hole)
  $stdout.written.should == view
  restore_stdout()
end

def replace_stdout
  @old_stdout = $stdout
  MyStdout.new
end
def restore_stdout()
  $stdout = @old_stdout
end

class MyStdout
  attr_reader :written
  def initialize
    @written = ""
  end
  def write(string)
    @written += string
  end

end