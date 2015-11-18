class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    authorize @review
    course = @review.course
    if @review.save
      redirect_to profile_path
      # respond_to do |format|
      #   format.html {  }
      #   format.js  # <-- will render `app/views/reviews/create.js.erb`
      # end
    else
      # respond_to do |format|
      #   format.html { render 'course/show' }
      #   format.js  # <-- idem
      # end

      render profile_path, :alert => 'Alert message!'

    end
  end


  def destroy
    @review = Review.find(params[:id])
    authorize @review
    course = @review.course
    @review.destroy

    redirect_to profile_path
  end

  private
    def review_params
      params.require(:review).permit(:star, :comment, :course_id)
    end
end
