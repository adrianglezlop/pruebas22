class CodigoPostalController < ApplicationController
  def index
    render :json => JSON.parse(CodigoPostal.getData(params[:cp]))
  end
end
