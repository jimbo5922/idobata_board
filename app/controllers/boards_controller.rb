class BoardsController < ApplicationController
  before_action :logged_in_user

  def new
    @board = current_user.boards.build
  end

  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      flash[:success] = "スレッドを作成しました"
      redirect_to root_url
    else
      flash.now[:danger] = "タイトルと説明文は必須項目です"
      render 'new'
    end
  end

  def index
  end

  def show
  end

  private

    def board_params
      params.require(:board).permit(:title, :description)
    end
end