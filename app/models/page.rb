class Page < ApplicationRecord
  belongs_to :newspaper
  has_many :boxes, dependent: :destroy

  # give id to Page controller to get page_number back
  def page_number
    newspaper.pages.pluck(:id).index(id) + 1
  end

  # def page_id()
  #   newspaper.pages[pa]
  # end
end
