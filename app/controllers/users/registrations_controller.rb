class Users::RegistrationsController < Devise::RegistrationsController
before_action :configure_sign_up_params, only: [:create]
before_action :configure_account_update_params, only: [:update]


   #GET /resource/sign_up
   def new
     redirect_to root_path
   end
   #POST /resource
   def create
     redirect_to root_path
   end
   #GET /resource/edit
   def edit
     super
   end
   #PUT /resource
   def update
     super
   end
   #DELETE /resource
   def destroy
     super
   end
   #GET /resource/cancel
   #Forces the session data which is usually expired after sign
   #in to be expired now. This is useful if the user wants to
   #cancel oauth signing in/up in the middle of the process,
   #removing all OAuth session data.
   def cancel
     super
   end
   protected
   #If you have extra params to permit, append them to the sanitizer.
   def configure_sign_up_params
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password,:tipo,:app,:apm,
            :nom1,:nom2,:RFC,:CURP,:seguro,:INE,:nacionalidad,:fecha_nacimiento,:nac_ciudad,:nac_estado,
            :nac_pais,:sexo,:telefono_casa,:telefono_celular,:correo1,:correo2,:calle,:numero_int,:numero_ext,
            :colonia,:codigo_postal,:municipio,:estado,:pais,:ciudad_contrato) }
   end
   #If you have extra params to permit, append them to the sanitizer.
   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
   end
   #The path used after sign up.
   def after_sign_up_path_for(resource)
     super(resource)
   end
   #The path used after sign up for inactive accounts.
   def after_inactive_sign_up_path_for(resource)
     super(resource)
   end
  
end
