class Photo < ActiveRecord::Base
	belongs_to :place

	mount_uploader :photos, PictureUploader
end