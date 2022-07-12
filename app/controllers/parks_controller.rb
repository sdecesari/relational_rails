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

  def edit
    @park = Park.find(params[:id])
  end

  def update
    park = Park.find(params[:id])
    park.update(name: "Yosimite National Park", cost: params[:cost], daily_visitors: params[:daily_visitors])
    redirect_to "/parks/#{park.id}"
  end

end
