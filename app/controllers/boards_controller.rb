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
      flash.now[:danger] = "タイトル(1〜50字)と説明文(1〜100字)は必須項目です"
      render 'new'
    end
  end

  def show
    @board = Board.find(params[:id])
    @responce = Responce.new
    @user = User.find_by(id: @board.user_id)
  end

  def index
  end

  private

    def board_params
      params.require(:board).permit(:title, :description, category_ids: [])
    end
end