class Restaurant < ActiveRecord::Base

  # ASSOCIATIONS
  belongs_to :owner, :class_name => 'User'
  belongs_to :category
  has_many :reservations
  has_many :reviews
  has_many :customers, :through => :reservations

  # VALIDATIONS
  validates :name, presence: true

  # GeoCoder
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # Make new columns in schema for opening/closing hours of the restaurants

  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end


end
