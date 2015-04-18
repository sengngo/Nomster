class PlacesController < ApplicationController
	def index
 		 @places = Place.all
 		 @place = Place.paginate :per_page => 5, :page => params[:page],
								:conditions => ['name like ?', "%#{params[:search]}%"],
								:order => 'name'
	end

end
