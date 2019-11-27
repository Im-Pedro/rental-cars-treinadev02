class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturers.all
  end
  def show
    id = params[:id]
    @manufacturer = 
  end
end