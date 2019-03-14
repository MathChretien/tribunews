class Newspaper < ApplicationRecord
  belongs_to :tribe
  has_many :pages, dependent: :destroy
  has_many :pictures
end
