class Customer < User
  has_many :reservations
  has_many :restaurants, :through => :reservations
  has_many :reviews
end