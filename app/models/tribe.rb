class Tribe < ApplicationRecord
  has_many :users
  has_many :newspapers
end
