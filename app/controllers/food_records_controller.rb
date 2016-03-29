class FoodRecordsController < ApplicationController
  def new
    @food_record = FoodRecord.new
  end

  def create
    @food_record = current_user.food_records.create(food_record_params)
    if @food_record.save
      redirect_to root_path
    end
  end
  def index
    @food_records = current_user.food_records.find_by(intake_date: Date.today)
  end

  def edit
    @edit_food_record = current_user.food_records.find(params[:id])
  end

  def update
    current_user.food_records.find(params[:id]).update_attributes(food_record_params)
    redirect_to root_path
  end

  private
  def food_record_params
    params.require(:food_record).permit(:item, :quanity, :intake_date)
  end
end
