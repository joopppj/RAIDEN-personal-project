class Enemy
	SPEED = 4
	def initialize(window)
		@radius=20
		@x= rand(window.width-2*@radius)+@radius
		@y=40
		@image=Gosu::Image.new('images/enemy.png')
	end
	def draw
    @image.draw(@x - @radius, @y - @radius, 1)
  end
  def move
    @y += SPEED
  end
end