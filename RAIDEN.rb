require 'gosu'
require_relative 'player'
require_relative 'enemy'
require_relative 'shoot'
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
	end
	def update
		@player.turn_left if button_down?(Gosu::KbLeft)
		@player.turn_right if button_down?(Gosu::KbRight)
		@player.accelerate if button_down?(Gosu::KbUp)
		@player.move
		if rand<ENEMY_FREQUENCY
			@enemies.push Enemy.new(self)
		end
		@enemies.each do |enemy|
			enemy.move
		end
		@shoots.each do |shoot|
			shoot.move#
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
	
	end
end

window = RAIDEN.new
window.show end