class CollisionsController < ApplicationController

	def index
		@collisions = Collision.all
		
		respond_to do |format|
			format.html
			format.json
		end
	end

	def map
	end

end
