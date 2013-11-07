class Restaurant < ActiveRecord::Base

  validates :name, presence: true, uniqueness: true
  validates :description, length: { maximum: 200 }
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :phone, presence: true

  mount_uploader :photo, PhotoUploader
  mount_uploader :menu, MenuUploader

end
