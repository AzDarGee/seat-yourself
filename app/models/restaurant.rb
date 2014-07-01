class Restaurant < ActiveRecord::Base
  belongs_to :owner
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
