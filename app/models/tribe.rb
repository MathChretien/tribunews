class Tribe < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :users
  has_many :newspapers
end
