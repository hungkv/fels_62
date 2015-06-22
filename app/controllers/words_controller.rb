class WordsController < ApplicationController
  def index
    @categories = Category.all
    if params[:category_id]
      category = Category.find params[:category_id] rescue nil
      status = params[:state]
      @words = category.words.send "get_#{status}", current_user
    else
      @words = Category.first.words
    end
  end
end
