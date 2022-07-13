class ParkTrailsController < ApplicationController
   def index
      @park = Park.find(params[:park_id])
      @trails = @park.trails
   end

   def new
     @id = params[:id]
   end

   def create
      Trail.create(name: params[:name], difficulty: params[:difficulty], open: params[:true])
      redirect_to "parks/#{params[:id]}/trails"
   end

end
