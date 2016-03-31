class FoodRecord < ActiveRecord::Base
  belongs_to :user

  after_create :compute_calories
  after_update :update_calories

  validates :item, :quantity, :intake_date, presence: true
  validates :quantity, numericality: {only_integer: false}

  def compute_calories
    @item = FoodItem.find_by(item: self.item)
    @calories_intake = @item.calories*self.quantity
    self.update_attributes(intake_calories: @calories_intake)
  end

  def update_calories
    @item = FoodItem.find_by(item: self.item)
    @calories_intake = @item.calories*self.quantity
    if self.intake_calories != @calories_intake
      self.update_attributes(intake_calories: @calories_intake)
    end
  end
end
