class IntersectionsController < ApplicationController

	def index
		@intersections = Intersection.all
	end

end
