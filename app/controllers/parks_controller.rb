class ParksController < ApplicationController
   def index
      @parks = Park.all
   end

   def show
      @park = Park.find(params[:id])
   end

   def new
   end

  def create
    Park.create(name: params[:name], cost: true, daily_visitors: 0)
    redirect_to "/parks"
  end

end
