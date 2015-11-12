class SubscriptionController < ApplicationController

  before_action :authenticate_user!

  def free

  course = Course.find(params[:course_id])
  current_user.subscriptions.create(course: course)

  redirect_to course_path(course)
  end

end
