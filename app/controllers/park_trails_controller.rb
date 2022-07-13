class ParkTrailsController < ApplicationController
   def index
      @park = Park.find(params[:park_id])
      @trails = @park.trails
      if params[:sort] == "alpha"
        @trails = @park.trails.alphabetical_order
      elsif params[:difficulty]
         hike = params[:difficulty].to_i
         @trails = @park.trails.where("difficulty > ?", hike)
      else
        @trails = @park.trails
      end
   end

   def new
    @park = Park.find(params[:park_id])
   end

   def create
      @park = Park.find(params[:park_id])
      @park.trails.create(trail_params)
      redirect_to "/parks/#{@park.id}/trails"
   end

   private
   def trail_params
    params.permit(:name, :difficulty, :open)    
   end
end
