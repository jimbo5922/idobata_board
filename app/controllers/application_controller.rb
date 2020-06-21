class ApplicationController < ActionController::Base
  include SessionsHelper

  private
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "ログインが必要です"
        redirect_to login_url
      end
    end

    def search
      q = params[:q] 
      @boards = Board.search(name_cont: q).result 
      @responces = Responce.search(name_cont: q).result 
    end

    def boards_search_params
      params.require(:q).permit(:title_cont)
    end
end