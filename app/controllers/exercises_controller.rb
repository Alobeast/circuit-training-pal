class ExercisesController < ApplicationController
  before_action :set_session
  before_action :set_block
  before_action :set_exercise, only: [:edit, :update, :destroy]

  def new
    @exercise = @block.exercises.build
  end

  def create
    @exercise = @block.exercises.build(exercise_params)

    if @exercise.save
      respond_to do |format|
        format.html { redirect_to session_path(@session), notice: "Exercise was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Exercise was successfully created."  }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      respond_to do |format|
        format.html { redirect_to session_path(@session), notice: "Exercise was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Exercise was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @exercise.destroy

    respond_to do |format|
      format.html { redirect_to session_path(@session), notice: "Exercise was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Exercise was successfully destroyed." }
    end
  end


  private

  def exercise_params
    params.require(:exercise).permit(:name, :comment, :reps, :weight)
  end

  def set_session
    @session = Session.find(params[:session_id])
  end

  def set_block
    @block = @session.blocks.find(params[:block_id])
  end

  def set_exercise
    @exercise = @block.exercises.find(params[:id])
  end
end
