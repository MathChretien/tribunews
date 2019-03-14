class Tribe < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :users
  has_many :newspapers

  after_create do
    return if self.newspapers.any?
    newspaper = self.newspapers.create(published_on: Date.today.end_of_month)
    (1..12).each do |number|
      newspaper.pages.create(number: number)
    end
  end

  # for our demo we have only one newspaper :D
  # otherwise we should provide a current_newspaper-field
  def current_newspaper
    return newspapers.last
  end
end
