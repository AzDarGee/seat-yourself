class Restaurant < ActiveRecord::Base
  validates :name, presence: true

  belongs_to :owner
  belongs_to :category
  has_many :reservations
  has_many :reviews


  # Make new columns in schema for opening/closing hours of the restaurants


  def self.search(search)
    if search
      where('name ILIKE ?', "%#{search}%")
    else
      all
    end
  end


end
