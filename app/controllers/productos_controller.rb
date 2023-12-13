class ProductosController < ApplicationController
  def index
    @productos = Producto.all
  end
  def show
        @producto = Producto.find(params[:id])
  end
  def new
      @producto = Producto.new
  end
  def create
    @producto = Producto.new(producto_params)
    pp @producto

    if @producto.save
      redirect_to productos_path, notice: 'Tu producto se ha creado correctamente'
    else
      render :new, status: :unprocessable_entity
    end
  end
  def edit
    @producto = Producto.find(params[:id])
  end
  def update
    @producto = Producto.find(params[:id])
    if @producto.update(producto_params)
      redirect_to productos_path, notice: 'Tu producto se ha actualizado correctamente'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    @producto = Producto.find(params[:id])
    @producto.destroy

    redirect_to productos_path, notice: 'Tu producto se ha eliminado correctamente', status: :see_other
  end

  private

  def producto_params
        params.require(:producto).permit(:Nombre, :Descripcion, :Precio, :photo)
  end
end
