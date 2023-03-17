class CombosController < ApplicationController
  def pais
    @countries =  CCountry.all
    @countries = @countries.order(:nombre)
  end

  def estado
    @states = CState.all
    @states = @states.where(c_country_id:params[:id_country]) unless  params[:id_country].nil? or params[:id_country]==""
    @states=@states.order(:nombre)
  end

  def ciudad
    @municipalities = CMunicipality.all
    @municipalities = @municipalities.where(c_state_id:params[:id_state]) unless  params[:id_state].nil? or params[:id_state]==""
    @municipalities = @municipalities.order(:nombre)
  end
end
