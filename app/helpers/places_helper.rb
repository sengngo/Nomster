module PlacesHelper
	def comment_drop
		comment.place.try(:name)
	end
end

def create
		@place = current_user.places.create(place_params)
		if @place.valid?
			redirect_to root_path
		else
			render :new, :status => :unprocessable_entity
		end
	end