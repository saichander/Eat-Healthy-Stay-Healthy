class FoodItemsController < ApplicationController

  def new
    @food_item = FoodItem.new
  end

  def create
    @food_item = FoodItem.create(food_item_params)
    if @food_item.save
      redirect_to food_items_path
    end
  end

  def index
    @food_item = FoodItem.new
    @food_list = FoodItem.all
  end

  def edit
    @food_item = FoodItem.find(params[:id])
  end

  def update
    @food_item = FoodItem.find(params[:format])
    @food_item.update_attributes(food_item_params)
    redirect_to root_path
  end

  def destroy
   if FoodItem.find(params[:id]).destroy
     redirect_to food_items_path
   end
  end
  private
  def food_item_params
    params.require(:food_item).permit(:item, :quantity, :metrics, :calories)
  end
end
