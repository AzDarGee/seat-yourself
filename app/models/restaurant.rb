class Restaurant < ActiveRecord::Base
  belongs_to :owner
  belongs_to :category
  has_many :reservations
  has_many :reviews
end
