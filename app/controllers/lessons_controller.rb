class LessonsController < ApplicationController
  skip_after_action :verify_policy_scoped

  before_action :set_course
  before_action :set_lessons

  layout "course", only: [:index]

  def index
  end

  def show

    @lesson = @lessons.find(params[:id])
    @next_lesson = @lesson.next
    @prev_lesson = @lesson.prev

    authorize @lesson
  end

  private

  def set_course
    @course = current_user.courses.find(params[:course_id])
  end

  def set_lessons
    @lessons = @course.lessons
  end
end
