class RegisterController < ApplicationController
  before_action :verify_user!
  def index
  end
  def verify_user!
    if cookies[:userId]
      redirect_to home_index_path
    end
  end
end
