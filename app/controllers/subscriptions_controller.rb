class SubscriptionsController < ApplicationController

  before_action :authenticate_user!

  def show
    @course = Course.find(params[:course_id])
    @subscription = Subscription.where(state: 'paid').find(params[:id])
    authorize @subscription
  end

  def create
    course        = Course.find(params[:course_id])
    subscription  = current_user.subscriptions.new(course: course)
    subscription.state = 'pending'
    subscription.amount = course.price
    authorize subscription

    if subscription.save
      # flash[:notice] = "Inscription au cours réussie."
      redirect_to new_course_subscription_payment_path(subscription.course, subscription)
    else
      flash[:alert] = "Nous ne parvenons pas à vous inscrire au cours."
      redirect_to course_path(course)
    end
  end
end
