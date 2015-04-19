class Photo < ActiveRecord::Base
	belongs_to :place
	belongs_to :user
	mount_uploader :photos, PictureUploader
end