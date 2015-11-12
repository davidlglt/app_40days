class ProfileController < ApplicationController
  skip_after_action :verify_authorized

  def show
    @user = current_user
    @courses = current_user.courses
  end
end
