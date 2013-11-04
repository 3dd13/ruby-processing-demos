# RubyProcessingTree

class BounceBall < Processing::App
  def setup
    size 200, 200
    
    @posX = 10
    @posY = 10   
    
    @direction = 1
  end
  
  def draw
    background 255
    
    fill 240, 100, 100
    ellipse @posX, @posY, 30, 30
    
    @posX += 1 * @direction
    @posY += 1 * @direction
    
    if @posX > width - 1
      @direction = -1
    elsif @posX < 0
      @direction = 1
    end
  end
  
end

BounceBall.new :title => "Bounce Ball"