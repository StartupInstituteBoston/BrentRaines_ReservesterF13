class Reservation < ActiveRecord::Base
  belongs_to :restaurant
  validates :email, presence: true
  validates :time, presence: true
end
