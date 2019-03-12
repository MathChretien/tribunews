class Newspaper < ApplicationRecord
  belongs_to :tribe
  has_many :pages
end
