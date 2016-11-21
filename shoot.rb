class  Shoot 
	SPEED = 5
attr_reader :x, :y, :radius
  def initialize(window, x, y, angle)
    @x = x
    @y = y
    @direction = angle
    @image = Gosu::Image.new('images/beam1.png')
    @radius = 3
    @window = window
  end
def move
    @x += Gosu.offset_x(@direction, SPEED)
    @y += Gosu.offset_y(@direction, SPEED)
end
def draw
  @image.draw(@x - @radius, @y - @radius, 1)
end
end
