class User < ActiveRecord::Base
  has_secure_password
  self.inheritance_column = :role

  validates :email, presence: true
  validates :email, :uniqueness => true
end
