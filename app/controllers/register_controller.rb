class RegisterController < ApplicationController
  before_action :verify_user!
  def index
  end

  def validate_account
    user_data = Rails.cache.read(params[:email])
    if user_data
      redirect_to register_index_path, notice: 'Email já cadastrado'
    elsif !!(params[:name].delete(' ') =~ /^.{5,128}$/) == false 
      redirect_to register_index_path, notice: 'O nome tem que ter no mínimo de 5 e máximo de 128 caracteres.'
    elsif !!(params[:email] =~ /^[a-zA-Z0-9!#$%&'*+-=?^_`{|}~.]{1,64}[@][a-zA-Z0-9.-].{1,128}$/) == false
      redirect_to register_index_path,  notice: "Email: local-part@domain
                                        ○ local-part: máximo de 64 caracteres, formado por dígitos (0-9), letras maiúsculas
                                        (A-Z) ou minúsculas (a-z), caracteres especiais (!#$%&'*+-/=?^_`{|}~) ou ponto (.)
                                        ○ domain: máximo de 128 caracteres, formado por dígitos (0-9), letras maiúsculas
                                        (A-Z) ou minúsculas (a-z), ponto (.) ou hífen (-)."
      elsif !!(params[:password] =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{10,128}$/) == false
      redirect_to register_index_path,                                  notice: "Senha: mínimo de 10 caracteres e máximo de 128, sendo no mínimo 2 dígitos (0-9), 2
                                        caracteres especiais, 2 letras maiúsculas (A-Z) e 2 letras minúsculas (a-z)."
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
