class User < ActiveRecord::Base

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  has_many :restaurants
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ROLES = %w[owner admin]

  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
