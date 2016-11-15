class Player
	ROTATION_SPEED=2 
	ACCELERATION=2
	FRICTION=0.9
	def initialize(window)
		@x=200
		@y=200
		@angle =0
		@image = Gosu::Image.new('images/player.png')
		@velocity_x=0
		@velocity_y=0
		@window=window
		@radius=0
	end
	def draw
	@image.draw_rot(@x,@y,1,@angle)
	end
	def turn_right
		@angle +=ROTATION_SPEED
	end
	def turn_left
		@angle -=ROTATION_SPEED
	end
	def accelerate 
		@velocity_x += Gosu.offset_x(@angle,ACCELERATION)
		@velocity_y += Gosu.offset_y(@angle,ACCELERATION)
	end
	def move
		@x +=@velocity_x
		@y +=@velocity_y
		@velocity_x *=FRICTION
		@velocity_x *=FRICTION
		if @x > @window.width - @radius
       		@velocity_x = 0
       		@x = @window.width - @radius
    	end
    	if @x < @radius
      		@velocity_x = 0
      		@x = @radius
    	end
    	 if @y > @window.height - @radius
      		@velocity_y = 0
     	    @y = @window.height - @radius
    	 end
		 if @y < @radius
      		@velocity_y = 0
      		@y = @radius
    	end
	end
end
