class StaticPageController < ApplicationController
  def home
    if logged_in?
      @board = current_user.boards.build
      @feed_items = current_user.feed
    end
  end
end