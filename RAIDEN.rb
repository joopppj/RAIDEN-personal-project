require 'gosu'
require_relative 'player'
class RAIDEN < Gosu::Window
	def initialize
		super(800,600)
		self.caption = 'RAIDEN'
		@player = Player.new(self)
	end
	def draw
		@player.draw
	end
	def update
		@player.turn_left if button_down?(Gosu::KbLeft)
		@player.turn_right if button_down?(Gosu::KbRight)
		@player.accelerate if button_down?(Gosu::KbUp)
		@player.move
	end
	
end

window = RAIDEN.new
window.show
