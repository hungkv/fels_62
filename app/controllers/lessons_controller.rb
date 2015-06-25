class LessonsController < ApplicationController
  before_action :authenticate_user!

  def edit
    @lesson = Lesson.find params[:id] rescue nil
  end

  def create
    category = Category.find params[:category_id] rescue nil
    lesson = current_user.lessons.build category: category if category.present?
    if lesson && lesson.save
      flash[:notice] = "Lesson create successfully"
      redirect_to edit_lesson_path lesson
    else
      redirect_to categories_path
    end
  end

  def update
    lesson = Lesson.find params[:id] rescue nil
    if lesson && lesson.update_attributes(params_lesson)
      flash[:notice] = t "message.success"
      redirect_to lesson_path lesson
    else
      flash[:error] = t "message.error"
      redirect_to categories_path
    end
  end

  def show
    @lesson = Lesson.find params[:id] rescue nil
    @lesson_words = @lesson.lesson_words.answered rescue nil    
  end

  private
  def params_lesson
    params.require(:lesson).permit :category_id, lesson_words_attributes: [:id, :answer_id]
  end
end
