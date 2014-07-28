class CollisionsController < ApplicationController

	def index
		@collisions = Collision.all
	end

end
