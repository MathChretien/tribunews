class Box < ApplicationRecord
  belongs_to :page
  has_one :picture
end
