class IntersectionsController < ApplicationController

	def index
		@intersections = Intersection.all

    @sum_collisions = Intersection.sum('collisions')
    @sum_persons_injured = Intersection.sum('persons_injured')
    @sum_persons_killed = Intersection.sum('persons_killed')
    @sum_pedestrians_injured = Intersection.sum('pedestrians_injured')
    @sum_pedestrians_killed = Intersection.sum('pedestrians_killed')
    @sum_cyclists_injured = Intersection.sum('cyclists_injured')
    @sum_cyclists_killed = Intersection.sum('cyclists_killed')
    @sum_motorists_injured = Intersection.sum('motorists_injured')
    @sum_motorists_killed = Intersection.sum('motorists_killed')

    @average_collisions = Intersection.average('collisions')
    @average_persons_injured = Intersection.average('persons_injured')
    @average_persons_killed = Intersection.average('persons_killed')
    @average_pedestrians_injured = Intersection.average('pedestrians_injured')
    @average_pedestrians_killed = Intersection.average('pedestrians_killed')
    @average_cyclists_injured = Intersection.average('cyclists_injured')
    @average_cyclists_killed = Intersection.average('cyclists_killed')
    @average_motorists_injured = Intersection.average('motorists_injured')
    @average_motorists_killed = Intersection.average('motorists_killed')

    respond_to do |format|
      format.html
      format.json
    end
	end

end
