require 'gosu'
require_relative 'player'
require_relative 'enemy'
require_relative 'shoot'
require_relative 'explosion'
class RAIDEN < Gosu::Window
	 WIDTH = 800
  HEIGHT = 600
  ENEMY_FREQUENCY = 0.05

	def initialize
		super(WIDTH,HEIGHT)
		self.caption = 'RAIDEN'
		@player = Player.new(self)
		@enemies=[]
		@shoots=[]
        @explosions=[]
	end
	def update
		@player.turn_left if button_down?(Gosu::KbLeft)
		@player.turn_right if button_down?(Gosu::KbRight)
		@player.accelerate if button_down?(Gosu::KbUp)
		@player.move
		if rand<ENEMY_FREQUENCY
			@enemies.push Enemy.new(self)
		end
		@enemies.each do |zz|
			zz.move
		end
		@shoots.each do |shoot|
			shoot.move
		end
		@enemies.each do |enemy|
      			@shoots.each do |bullet|
        				distance = Gosu.distance(enemy.getx, enemy.gety, bullet.x, bullet.y)
        				if distance < enemy.radius + bullet.radius
          				@enemies.delete enemy
                        @shoots.delete bullet
                        @explosions.push Explosion.new(self,enemy.getx,enemy.gety)
                        end
     			 end
   		 end
        @explosions.dup.each do |explosion|
            @explosions.delete explosion if explosion.getf
        end
        @enemies.dup.each do |enemy|
            if enemy.gety>HEIGHT+enemy.radius
                @enemies.delete enemy
            end
        end
        @shoots.dup.each do |bullet|
            @shoots.delete bullet unless bullet.onscreen?
        end
	def button_down(id)
		if id==Gosu::KbSpace
			@shoots.push Shoot.new(self, @player.x, @player.y,@player.angle)
		end
	end
	def draw
		@player.draw
		@enemies.each do |enemy|
			enemy.draw
		end
		@shoots.each do |shoot|
			shoot.draw
		end
        @explosions.each do|explosion|
            explosion.draw
        end
	end
end

window = RAIDEN.new
window.show end
