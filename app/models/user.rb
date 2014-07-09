class User < ActiveRecord::Base
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable

  easy_roles :roles, method: :bitmask
  # Constant variable storing roles in the system --> DO NOT CHANGE ORDER OF ARRAY, APPEND TO END TO ADD NEW ROLE
  ROLES = %w[owner user]

  validates :email, presence: true
  validates :email, :uniqueness => true
end
