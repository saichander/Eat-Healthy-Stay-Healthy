class BodyMetricsController < ApplicationController
  before_action :authenticate_user!

  def new
    if current_user.body_metric.nil?
      @user_body_metric = current_user.build_body_metric
    else
      redirect_to edit_body_metric_path
    end
  end

  def create
    @user_body_metric = current_user.build_body_metric(body_metric_params)
    if @user_body_metric.save
      flash[:success] = "Successfully calculated"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @edit_body_metric = current_user.body_metric
  end

  def update
    if current_user.body_metric.update_attributes(body_metric_params)
      flash[:success] = "Successfully updated"
      redirect_to root_path
    else
      @edit_body_metric = current_user.body_metric
      render 'edit'
    end
  end

  private
  def body_metric_params
    params.require(:body_metric).permit(:height, :weight, :activity_level)
  end
end
