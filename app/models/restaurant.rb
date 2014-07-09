class Restaurant < ActiveRecord::Base

  # ASSOCIATIONS
  belongs_to :owner
  belongs_to :category
  has_many :reservations
  has_many :reviews
  has_many :customers, :through => :reservations

  # VALIDATIONS
  validates :name, presence: true



  # Make new columns in schema for opening/closing hours of the restaurants


  def self.search(search)
    if search
      where('name ILIKE ?', "%#{search}%")
    else
      all
    end
  end


end
