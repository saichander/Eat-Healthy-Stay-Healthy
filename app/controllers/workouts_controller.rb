class WorkoutsController < ApplicationController
  def new
    if current_user.admin?
      @workout = Workout.new
    else
      redirect_to workouts_path
    end
  end

  def create
    if current_user.admin?
      @workout = Workout.create(workout_params)
      if @workout.save
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
    @workout = Workout.find(params[:id])
  end

  def update
    if current_user.admin?
      @workout = Workout.find(params[:id])
      if @workout.update_attributes(workout_params)
        redirect_to workouts_path
      else
        render 'edit'
      end
    end
  end

  def destroy
    if current_user.admin?
      @workout = Workout.find(params[:id])
      if @workout.destroy
        redirect_to workouts_path
      end
    end
  end

  private

  def workout_params
    params.require(:workout).permit(:title, :youtube_url)
  end
end
