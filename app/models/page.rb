class Page < ApplicationRecord
  belongs_to :newspaper
  has_many :boxes
end
