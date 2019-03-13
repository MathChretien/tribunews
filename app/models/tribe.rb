class Tribe < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :users
  has_many :newspapers

  # for our demo we have only one newspaper :D
  # otherwise we should provide a current_newspaper-field
  def current_newspaper
    return newspapers.last
  end
end
