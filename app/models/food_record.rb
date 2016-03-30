class FoodRecord < ActiveRecord::Base
  belongs_to :user

  after_create :compute_calories
  after_update :update_calories

  def compute_calories
    @food_record = User.find_by(id: user_id).food_records.last
    @item = FoodItem.find_by(item: @food_record.item)
    @calories_intake = @item.calories*@food_record.quantity
    @food_record.update_attributes(intake_calories: @calories_intake)
  end

  def update_calories
    @food_record = User.find_by(id: user_id).food_records.find_by(id: id)
    @item = FoodItem.find_by(item: @food_record.item)
    @calories_intake = @item.calories*@food_record.quantity
    if @food_record.intake_calories != @calories_intake
      @food_record.update_attributes(intake_calories: @calories_intake)
    end
  end
end
