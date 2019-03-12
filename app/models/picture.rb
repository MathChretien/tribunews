class Picture < ApplicationRecord
  belongs_to :box
  belongs_to :newspaper
end
