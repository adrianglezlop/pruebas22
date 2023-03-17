class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    added_attrs = [:alias, :email, :password, :password_confirmation, :remember_me]
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password,:tipo,:app,:apm,
      :nom1,:nom2,:RFC,:CURP,:seguro,:INE,:nacionalidad,:fecha_nacimiento,:nac_ciudad,:nac_estado,
      :nac_pais,:sexo,:telefono_casa,:telefono_celular,:correo1,:correo2,:calle,:numero_int,:numero_ext,
      :colonia,:codigo_postal,:municipio,:estado,:pais,:alias) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :current_password) }
  end
  before_filter :authenticate_user! , :except => [:hola]
end
