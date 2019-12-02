class ManufacturersController < ApplicationController
  def index
    @manufacturers = Manufacturer.all
  end

  def show
    id = params[:id]
    @manufacturer = Manufacturer.find(id)
  end

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.create(manufacturer_params)

    if @manufacturer.save
      redirect_to @manufacturer
    else
      flash.now[:alert] = 'Todo os campos devem ser preenxidos'
      render :new #não está rodando o new, só usando ele
    end
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])
    if @manufacturer.update(manufacturer_params)
      flash[:notice] = 'Fabricante atualizada com sucesso'
      redirect_to @manufacturer
    else
      render :edit
    end
  end

  def manufacturer_params
    params.require(:manufacturer).permit(:name)
  end
end
