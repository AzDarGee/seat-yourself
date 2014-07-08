class Restaurant < ActiveRecord::Base
  belongs_to :owner
  belongs_to :category
  has_many :reservations
  has_many :reviews

  def self.search(search)
    if search
      where('name ILIKE ?', "%#{search}%")
    else
      all
    end
  end


end
