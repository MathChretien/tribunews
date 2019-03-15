class Picture < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :box, optional: true
  belongs_to :newspaper
end
