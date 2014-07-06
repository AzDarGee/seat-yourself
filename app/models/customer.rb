class Customer < User
  has_many :reservations
  has_many :reviews
end