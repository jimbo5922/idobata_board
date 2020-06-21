class StaticPageController < ApplicationController
  def home
    if logged_in?
      @board = current_user.boards.build
      if params[:q] && params[:q].reject{ |key, value| value.blank? }.present?
        @search = Board.ransack(params[:q])
        @feed_items = @search.result
      else
        @search = Board.none.ransack
        @feed_items = current_user.feed
      end
      @url = root_path
    end
  end
end