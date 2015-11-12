class LessonController < ApplicationController
  def show
    course = Course.find(params[:course_id])
    @lessons = course.lessons.order(:tag)
    @lesson = @lessons.find(params[:id])

    @next_lesson = @lesson.next
    @prev_lesson = @lesson.prev

    authorize @lesson
  end
end
