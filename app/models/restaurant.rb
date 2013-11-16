class Restaurant < ActiveRecord::Base

  belongs_to :user
  has_many :reservations
  accepts_nested_attributes_for :reservations, allow_destroy: true
  validates :name, presence: true
  validates :user, presence: true
  validates :description, length: { maximum: 200 }

  mount_uploader :photo, PhotoUploader
  mount_uploader :menu, MenuUploader

end
