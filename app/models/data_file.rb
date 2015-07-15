class DataFile < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  mount_uploader :profile_photo, ProfilePhotoUploader
end
