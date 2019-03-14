class User < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :tribe, optional: true
  accepts_nested_attributes_for :tribe
  before_create :add_tribe

  def add_tribe
   if self.tribe.nil? && self.invitation_accepted_at.nil?
    tribe =  Tribe.create()
    self.tribe = tribe
    end
  end
end
