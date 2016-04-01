class DynamicPagesController < ApplicationController
  def home
    if user_signed_in?
      @food_records = current_user.food_records.where(intake_date: Date.today)
      if current_user.body_metric.nil?
        redirect_to new_body_metric_path
      end
    end
  end
end
