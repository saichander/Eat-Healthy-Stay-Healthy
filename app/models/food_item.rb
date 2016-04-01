class FoodItem < ActiveRecord::Base
  validates :item, :quantity, :metrics, :calories, presence: true
  validates :item, uniqueness: true
  validates :quantity, :calories, numericality: {only_integer: true, :allow_blank => true}
end
