class BlocksController < ApplicationController
  before_action :set_session
  before_action :set_block, only: [:edit, :update, :destroy]

  def new
    @block = @session.blocks.build
  end

  def create
    @block = @session.blocks.build(block_params)

    if @block.save
      respond_to do |format|
        format.html { redirect_to session_path(@session), notice: "Block was successfully created." }
        format.turbo_stream { flash.now[:notice] = "Block was successfully created." }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @block.update(block_params)
      redirect_to session_path(@session), notice: "Block was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @block.destroy
    respond_to do |format|
      format.html { redirect_to session_path(@session), notice: "Block was successfully destroyed." }
      format.turbo_stream { flash.now[:notice] = "Block was successfully destroyed." }
    end
  end

  private

  def set_block
    @block = @session.blocks.find(params[:id])
  end

  def block_params
    params.require(:block).permit(:name)
  end

  def set_session
    @session = Session.find(params[:session_id])
  end
end
