class SubscriptionsController < ApplicationController

  before_action :authenticate_user!

  def create
    course        = Course.find(params[:course_id])
    subscription  = current_user.subscriptions.new(course: course)
    authorize subscription

    if subscription.save
      flash[:notice] = "Inscription au cours réussie."
      redirect_to profile_path
    else
      flash[:alert] = "Nous ne parvenons pas à vous inscrire au cours."
      redirect_to course_path(course)
    end
  end
end
