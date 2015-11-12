class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  skip_after_action :verify_policy_scoped
  skip_after_action :verify_authorized
  def home
  end
end
