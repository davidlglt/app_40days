class ProfileController < ApplicationController
  skip_after_action :verify_authorized
  layout "dashboard"

  def show
    @user = current_user
    @courses = current_user.courses
    @review = Review.new
  end
end
