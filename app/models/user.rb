class User < ActiveRecord::Base
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable

  Roles = [:owner,:default]

  def is?(requested_role)
    self.role == requested_role.to_s
  end


  validates :email, presence: true
  validates :email, :uniqueness => true
end
