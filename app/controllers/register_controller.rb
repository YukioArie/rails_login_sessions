class RegisterController < ApplicationController
  before_action :verify_user!
  def index
  end

  def validate_account
    user_data = Rails.cache.read(params[:email])
    if user_data
      redirect_to register_index_path, notice: 'Email já cadastrado'
    else
      Rails.cache.write(params[:email], "#{params[:name]}@@#{params[:password]}")
      redirect_to login_index_path, notice: 'Conta cadastrada com sucesso'
    end
  end
  

  def verify_user!
    if cookies[:userId]
      redirect_to home_index_path
    end
  end
end
