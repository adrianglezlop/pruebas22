#class ProfileController < ApplicationController
#  before_action :set_user, only: [:show, :edit, :update]
#  before_action :manejo_de_usuarios, only: [:create,:new] 
#  
#  def index
#    @users=User.all
#  end
#  def edit
#    
#  end
#
#  def show
#    
#  end
#  def new
#    @user = User.new
#  end
#  def create
#    @user = User.new(user_params)
#
#    respond_to do |format|
#      if @user.save
#        format.html { redirect_to root_path, notice: 'user was successfully created.' }
#        format.json { render :show, status: :created, location: @user }
#      else
#        format.html { render :new }
#        format.json { render json: @user.errors, status: :unprocessable_entity }
#      end
#    end
#  end
#  def update
#      respond_to do |format|
#      if @user.update(user_params)
#        format.html { redirect_to show_profile_path, notice: 'El perfil fue actualizado' }
#        format.json { render :show, status: :ok, location: @user }
#      else
#        @notificacion="Error al ingresar datos"
#        format.html { render :edit }
#        format.json { render json: @user.errors, status: :unprocessable_entity }
#      end
#    end
#  end
#  def user_params
#    params.require(:user).permit(:email, :password,:tipo,:app,:apm,:nom1,:nom2,:RFC,:CURP,:seguro,:INE,:nacionalidad,:fecha_nacimiento,:nac_ciudad,:nac_estado,
#          :nac_pais,:sexo,:telefono_casa,:telefono_celular,:correo1,:correo2,:calle,:numero_int,:numero_ext,
#          :colonia,:codigo_postal,:municipio,:estado,:pais)
#  end
#  def set_user
#    @user = params[:id]
#  end
#   def manejo_de_usuarios
#       redirect_to root_path unless current_user.tipo == 1 
#   end
#end

class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy,:edit_pass]
  before_action :manejo_de_usuarios, only: [:create,:new,:destroy,:edit] 

  def perfil
    @user = current_user
    redirect_to @user
  end
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end
  
  def edit_pass
  end

  def create2
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'user was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
      respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'El perfil fue actualizado' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def user_params
    params.require(:user).permit(:email, :password,:tipo,:app,:apm,:nom1,:nom2,:RFC,:CURP,:seguro,:INE,:nacionalidad,:fecha_nacimiento,:nac_ciudad,:nac_estado,
          :nac_pais,:sexo,:telefono_casa,:telefono_celular,:correo1,:correo2,:calle,:numero_int,:numero_ext,
          :colonia,:codigo_postal,:municipio,:estado,:pais,:alias)
    end
    
    def set_user
      @user = User.find(params[:id])
    end
    def manejo_de_usuarios
       redirect_to root_path unless current_user.tipo == 1 
    end
end
