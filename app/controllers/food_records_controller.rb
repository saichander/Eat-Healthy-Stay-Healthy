class FoodRecordsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_food_record, only: [:edit, :update, :destroy]

  def new
    @food_record = FoodRecord.new
  end

  def create
    @food_record = current_user.food_records.create(food_record_params)
    if @food_record.save
      flash[:added] = "you have gained #{@food_record.intake_calories} by eating #{@food_record.item}"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def index
    @food_record = FoodRecord.new
    #@food_records = current_user.food_records.where(intake_date: Date.today)
    @food_records = current_user.today_food_records
  end

  def edit
  end

  def update
    if @edit_food_record.update_attributes(food_record_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    if @edit_food_record.destroy
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

  def set_food_record
    @edit_food_record = current_user.food_records.find(params[:id])
  end
end
