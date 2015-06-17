class LessonsController < ApplicationController
  def edit
    
  end

  def create
    lesson = current_user.lessons.build category_id: params[:category_id]
    if lesson.save
      flash[:notice] = "Lesson create successfully"
      redirect_to edit_lesson_path(lesson.id)
    else
      redirect_to :back
    end
  end
end
