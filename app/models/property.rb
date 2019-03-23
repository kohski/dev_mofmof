class Property < ApplicationRecord
  validates :name,presence: true
  validates :rent,presence: true
  validates :address,presence: true
  validates :age,presence: true 
  validates :remark, presence: true

  has_many :stations, inverse_of: :property
  accepts_nested_attributes_for :stations, allow_destroy: true
end
