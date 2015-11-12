class CourseController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized

  def index
    @courses = Course.all
  end

  def show
    @course = Course.find(params[:id])


    @lessons = @course.lessons.order(:tag)


    # @joined = false

    # if !current_user.nil? && !current_user.courses.nil?
    #   @joined = current_user.courses.include?(@course)
    # end


    @review = Review.new
    @reviews = @course.reviews

    @hasReview = @reviews.find_by(user_id: current_user.id) if current_user
  end

#   def list
#     if !current_user.nil?
#       @courses = current_user.courses
#     end
#   end
end
