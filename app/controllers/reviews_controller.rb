class ReviewsController < ApplicationController

  def create
    @review = Review.create(review_params)
    course = @review.course
    if @review.save
      redirect_to course
    else
      render 'restaurants/show'
    end
  end


  def destroy
    @review = Review.find(params[:id])
    course = @review.course
    @review.destroy

    redirect_to course
  end

  private
    def review_params
      params.require(:review).permit(:star, :comment, :project_id, :user_id)
    end
end
