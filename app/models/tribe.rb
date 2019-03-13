class Tribe < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :users
  has_many :newspapers

   after_create do
    return if self.newspapers.any?
    newspaper = self.newspapers.create(published_on: Date.today.end_of_month)
    12.times do
      newspaper.pages.create()
    end


  end

end
