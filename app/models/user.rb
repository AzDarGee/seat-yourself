class User < ActiveRecord::Base
  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable

  ROLES = [:owner,:default]

  def is?(requested_role)
    self.role == requested_role.to_s
  end

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end
  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  validates :email, presence: true
  validates :email, :uniqueness => true
end
