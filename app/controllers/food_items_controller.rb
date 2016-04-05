class FoodItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food_item, only: [:edit, :update, :destroy]

  def new
    @food_item = FoodItem.new
  end

  def create
    if current_user.admin?
      @food_item = FoodItem.create(food_item_params)
      if @food_item.save
        flash[:success] = "Successfully added"
        redirect_to food_items_path
      else
        render 'new'
      end
    end
  end

  def index
    if current_user.admin?
      @food_item = FoodItem.new
    end
    @food_items = FoodItem.all
  end

  def edit
  end

  def update
    if current_user.admin?
      if @food_item.update_attributes(food_item_params)
        flash[:success] = "Successfully updated"
        redirect_to food_items_path
      else
        render 'edit'
      end
    end
  end

  def suggestion
    @time_of_the_day =FoodItem. get_time_of_the_day
    @suggestion = FoodItem.where(preferred_time: @time_of_the_day)
  end

  def destroy
    if @food_item.destroy
      redirect_to food_items_path
    end
  end

  private

  def food_item_params
    params.require(:food_item).permit(:item, :quantity, :metrics, :calories, :preferred_time)
  end

  def set_food_item
    @food_item = FoodItem.find(params[:id])
  end
end
