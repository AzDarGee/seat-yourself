class Restaurant < ActiveRecord::Base
  belongs_to :owner
  has_many :reservations
  has_many :reviews

end
