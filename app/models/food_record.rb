class FoodRecord < ActiveRecord::Base
  belongs_to :user

  before_save :compute_calories

  validates :item, :quantity, :intake_date, presence: true
  validates :quantity, numericality: {only_integer: false}

  def compute_calories
    @food_item = FoodItem.find_by(item: self.item)
    self.intake_calories = @food_item.calories * self.quantity
  end

  def self.food_records_by_date date=Date.today
    where(intake_date: date)
  end

  def self.find_todays_calories date
    where("intake_date = ?", date).sum(:intake_calories)
  end
end
