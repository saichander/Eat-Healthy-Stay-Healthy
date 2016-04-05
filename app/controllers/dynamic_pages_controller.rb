class DynamicPagesController < ApplicationController
  def home
    if user_signed_in?
      if current_user.body_metric.nil?
        redirect_to new_body_metric_path
      else
        @food_records = current_user.food_records.food_records_by_date
        @time_of_the_day =FoodItem. get_time_of_the_day
        @suggestion = FoodItem.where(preferred_time: @time_of_the_day).limit(10)
        @taken_calories = current_user.food_records.find_todays_calories
        @calc_calories = current_user.body_metric.calculated_calories
        @calc_width=(@taken_calories.to_f/@calc_calories.to_f)*100
        if @calc_width >= 100
          flash.now[:danger] = "You ate more than required calories for today"
        end
      end
    end
  end
end
