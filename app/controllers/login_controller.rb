class LoginController < ApplicationController
  def index
    console
  end
  def verify_login
    user_data = Rails.cache.read(params[:email])
    if user_data
      user_data_password = user_data.split('@@').last
      if user_data_password == params[:password]
        user_data_username = user_data.split('@@').first
        cookies[:userId] = SecureRandom.uuid
        Rails.cache.write(cookies[:userId], "#{user_data_username}@@#{params[:email]}")
        redirect_to home_index_path
      else
      redirect_to login_index_path, notice: 'Senha inválida'
      end
    else
      redirect_to login_index_path, notice: 'Usuário não encontrado'
    end
  end
end
