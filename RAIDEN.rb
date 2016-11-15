require 'gosu'
require_relative 'player'
require_relative 'enemy'
class RAIDEN < Gosu::Window
	WIDTH=800
	HEIGHT=600
	def initialize
		super(WIDTH,HEIGHT)
		self.caption = 'RAIDEN'
		@player = Player.new(self)
		@enemy=Enemy.new(self)
	end
	def draw
		@player.draw
		@enemy.draw
	end
	def update
		@player.turn_left if button_down?(Gosu::KbLeft)
		@player.turn_right if button_down?(Gosu::KbRight)
		@player.accelerate if button_down?(Gosu::KbUp)
		@player.move
		@enemy.move
	end
end

window = RAIDEN.new
window.show
