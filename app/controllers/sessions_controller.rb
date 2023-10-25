class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  def index
    @sessions = Session.ordered
  end

  def show
  end

  def new
    @session = Session.new
  end

  def create
    @session = Session.new(session_params)

    if @session.save
      respond_to do |format|
        format.html { redirect_to sessions_path, notice: "Session was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Session was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @session.update(session_params)
      respond_to do |format|
        format.html { redirect_to sessions_path, notice: "Session was successfully updated." }
        format.turbo_stream { flash.now[:notice] = "Session was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_path, notice: "Session was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Session was successfully destroyed." }
    end
  end

  private

  def set_session
    @session = Session.find(params[:id])
  end

  def session_params
    params.require(:session).permit(:name)
  end
end
