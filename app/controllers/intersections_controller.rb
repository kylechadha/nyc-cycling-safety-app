class IntersectionsController < ApplicationController

	def index
		@intersections = Intersection.all
    
    respond_to do |format|
      format.html
      format.json
    end
	end

end
