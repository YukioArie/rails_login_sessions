class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    user_data = Rails.cache.read(cookies[:userId]).split('@@')
    @username = user_data.first
    @email = user_data.last

  end
  def authenticate_user!
    unless cookies[:userId]
      redirect_to login_index_path
    end
    
  end
  
end
