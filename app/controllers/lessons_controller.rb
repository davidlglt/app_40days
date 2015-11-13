class LessonsController < ApplicationController
  before_action :set_course
  skip_after_action :verify_policy_scoped

  def index
    @lessons = @course.lessons
    @lesson = @lessons.first
  end

  def show
    course = Course.find(params[:course_id])
    @lessons = course.lessons.order(:tag)
    @lesson = @lessons.find(params[:id])

    @next_lesson = @lesson.next
    @prev_lesson = @lesson.prev

    authorize @lesson
  end

  private

  def set_course
    @course = current_user.courses.find(params[:course_id])
  end
end
