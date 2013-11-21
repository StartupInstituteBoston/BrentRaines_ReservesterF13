class Reservation < ActiveRecord::Base
  belongs_to :restaurant, dependent: :destroy
  validates :email, presence: true
  validates :time, presence: true
end
