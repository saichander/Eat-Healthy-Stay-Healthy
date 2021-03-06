class WorkoutsController < ApplicationController
  before_action :set_workout_record, only: [:edit, :update, :destroy]
  def new
    @workout = Workout.new
    @workouts = Workout.all
  end

  def create
    if current_user.admin?
      @workout = Workout.create(workout_params)
      if @workout.save
        flash[:success] = "Successfully added"
        redirect_to workouts_path
      else
        render 'new'
      end
    end
  end

  def index
    if params[:term]
      @workouts = Workout.search(params[:term])
    else
      @workouts = Workout.all
    end
  end

  def edit
  end

  def update
    if current_user.admin?
      if @workout.update_attributes(workout_params)
        flash[:success] = "Successfully updated"
        redirect_to workouts_path
      else
        render 'edit'
      end
    end
  end

  def destroy
    if current_user.admin?
      if @workout.destroy
        flash[:success] = "Successfully destroyed"
        redirect_to workouts_path
      end
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:title, :youtube_url)
  end

  def set_workout_record
    @workout = Workout.find(params[:id])
  end
end
