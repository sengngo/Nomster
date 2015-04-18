class PlacesController < ApplicationController
	before_action :authenticate_user!, :only => [:new, :create]
	
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
	  current_user.places.create(place_params)
	  redirect_to root_path
	end

	def show
		@place = Place.find(params[:id])
  	end

  	def edit
 		@place = Place.find(params[:id])
 	end

 	def update
 		@place = Place.find(params[:id])
 		@place.update_attributes(place_params)
 		redirect_to root_path
 	end
  private

 	def place_params
  	  params.require(:place).permit(:name, :description, :address)
  	end
end
