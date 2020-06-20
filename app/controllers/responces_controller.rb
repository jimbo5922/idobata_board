class ResponcesController < ApplicationController
  before_action :logged_in_user, only: :create

  def create
    @board = Board.find(params[:board_id])
    @responce = @board.responces.build(responce_params)
    @responce.user = current_user
    if @responce.save
      flash[:success] = "レスを投稿しました"
      redirect_to board_path(@board)
    else
      flash[:danger] = "レスは1〜100字以内で入力してください"
      redirect_to board_path(@board)
    end
  end

  private

    def responce_params
      params.require(:responce).permit(:content)
    end
end