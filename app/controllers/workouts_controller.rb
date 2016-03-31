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
    @workouts = Workout.all
  end

  def edit
    @workout = Workout.find(params[:id])
  end

  def update
    if current_user.admin?
      @workout = Workout.find(params[:format])
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

  def search
    @search_term = params[:search][:term]
    byebug
    Workout.where(title LIKE '%@search_term%')
    redirect_to root_path
  end
  private

  def workout_params
    params.require(:workout).permit(:title, :youtube_url)
  end
end
