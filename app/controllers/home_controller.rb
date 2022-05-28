class HomeController < ApplicationController
  before_action :authenticate_user!
  def index
    console
    if params[:query].present?
      @geolocationIp = GeolocationIp.new(params[:query])
    end
    user_data = Rails.cache.read(cookies[:userId]).split('@@')
    @username = user_data.first
    @email = user_data.last
  end
  def destroy_session
    Rails.cache.delete(cookies[:userId])
    cookies.delete(:userId)
    unless cookies[:userId]
      redirect_to login_index_path
    end
    
  end
  
  def authenticate_user!
    unless cookies[:userId]
      redirect_to login_index_path
    end
    
  end
  
end
