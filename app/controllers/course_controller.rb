class CourseController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])

    @lessons = @course.lessons

    @review = Review.new
    @reviews = @course.reviews

    @hasReview = @reviews.find_by(user_id: current_user.id) if current_user


    @lessons = @course.lessons.order(:tag)
  end
end
