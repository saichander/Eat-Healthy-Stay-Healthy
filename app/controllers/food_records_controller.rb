class FoodRecordsController < ApplicationController
  before_action :authenticate_user!

  def new
    @food_record = FoodRecord.new
  end

  def create
    @food_record = current_user.food_records.create(food_record_params)
    if @food_record.save
      redirect_to root_path
    else
      render 'new'
    end
  end
  def index
    @food_record = FoodRecord.new
    @food_records = current_user.food_records.where(intake_date: Date.today)
  end

  def edit
    @edit_food_record = current_user.food_records.find(params[:id])
  end

  def update
    @edit_food_record = current_user.food_records.find(params[:id])
    if @edit_food_record.update_attributes(food_record_params)
      redirect_to root_path
    else
      byebug
      render 'edit'
    end
  end

  def destroy
    if current_user.food_records.find_by(id: params[:id]).destroy
      redirect_to root_path
    end
  end

  def check_log
  end

  def search_log
    @food_records = current_user.food_records.where(intake_date: params[:food_log][:date])
  end

  private
  def food_record_params
    params.require(:food_record).permit(:item, :quantity, :intake_date)
  end
end
