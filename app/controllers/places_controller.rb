class PlacesController < ApplicationController
	def index
 		 @place = Place.all
 		 @place = Place.paginate :per_page => 5, :page => params[:page],
								:conditions => ['name like ?', "%#{params[:search]}%"],
								:order => 'name'
	end

	def new
		@place = Place.new
	end

	def create
    	Place.create(place_params)
    	redirect_to root_path
  	end

  private

 	def place_params
  	  params.require(:place).permit(:name, :description, :address)
  	end
end
