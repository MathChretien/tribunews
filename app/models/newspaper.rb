class Newspaper < ApplicationRecord
  belongs_to :tribe
  has_many :pages
  has_many :pictures
end
