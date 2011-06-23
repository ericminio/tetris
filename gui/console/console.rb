class Console

  def show(hole)
    output = ""
    hole.lines.reverse.each { |line|
      output += "\n"
      line.each { |char|
        if char == :empty
          output += " "
        elsif char == :wall
          output += "*"
        else
          output += "+"
        end
      }
    }
    output += "\n"
    
    puts output
  end

end