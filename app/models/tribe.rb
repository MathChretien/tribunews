class Tribe < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :users
  has_many :newspapers, dependent: :destroy

  after_create do
    return if self.newspapers.any?
    newspaper = self.newspapers.create(published_on: Date.today.end_of_month)
    (1..12).each do |number|
      var_page = newspaper.pages.create(number: number.to_s, layout: "3")
      9.times do |box|
        var_page.boxes.create
      end
      var_page.boxes.create(category: "text")
    end
  end

  # for our demo we have only one newspaper :D
  # otherwise we should provide a current_newspaper-field
  def current_newspaper
    return newspapers.last
  end
end
