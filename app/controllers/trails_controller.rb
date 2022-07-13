class TrailsController < ApplicationController
   def index
      @trails = Trail.all
   end

   def show
      @trail = Trail.find(params[:id])
   end

   def edit
     @trail = Trail.find(params[:id])
   end

   def update
     trail = Trail.find(params[:id])
     trail.update(name: [params[:id]], difficulty: params[:difficulty], open: params[:open])
     redirect_to "/trails/#{trail.id}"
   end

  def destroy
    trail = Trail.find(params[:id])
    trail.destroy
    redirect_to '/trails'
  end

end
