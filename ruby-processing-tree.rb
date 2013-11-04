# RubyProcessingTree

class RubyProcessingTree < Processing::App
  MAX_LEVEL = 7

  def setup
    size 800, 400
  end
  
  def draw
    background(255)
    theta = map(mouseX, 0, width, 0, PI/2)
    translate(width/2, height)
    stroke(0)
    branch(100, MAX_LEVEL)
  
    noLoop
  end
  
  def branch(length, currentLevel)
    if length > 5 && currentLevel > 0
      multiplier = MAX_LEVEL - currentLevel
      stroke(5 * multiplier, 20 * multiplier, 5 * multiplier)
      strokeWeight(currentLevel * (currentLevel / 2))
      line(0, 0, 0, -1 * length)
      translate(0, -1 * length)
  
      branchCount = random(4,6).to_i
      (0..branchCount).each do |i|
        theta = random(-PI / 4, PI / 4)
        pushMatrix()
        rotate(theta)
        h = length - random(10, 15).to_i
        branch(h, currentLevel - 1)
        popMatrix()
      end
    end
  end
  
end

RubyProcessingTree.new :title => "Ruby Processing Tree"