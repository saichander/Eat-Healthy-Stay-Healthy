class BodyMetricsController < ApplicationController
  def new
    @user_body_metric = current_user.build_body_metric
  end

  def create
    @user_body_metric = current_user.build_body_metric(body_metric_params)
  end

  def edit
  end

  private
  def body_metric_params
    params.require(:body_metric).permit(:height, :weight, :activity_level)
  end
end
