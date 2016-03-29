class FoodItemsController < ApplicationController

  def new
    @food_item = FoodItem.new
  end

  def create
    @food_item = FoodItem.create(food_item_params)
    if @food_item.save
      redirect_to root_path
    end
  end

  def index
    @food_list = FoodItem.all
  end

  private
  def food_item_params
    params.require(:food_item).permit(:item, :quantity, :metrics, :calories)
  end
end
