class ProductosController < ApplicationController
  def index
    @categories = Category.order(name: :asc)
    @productos = Producto.with_attached_photo
  end
  def show
    producto
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
    producto
  end
  def update

    if producto.update(producto_params)
      redirect_to productos_path, notice: 'Tu producto se ha actualizado correctamente'
    else
      render :edit, status: :unprocessable_entity
    end
  end
  def destroy
    producto.destroy

    redirect_to productos_path, notice: 'Tu producto se ha eliminado correctamente', status: :see_other
  end

  private

  def producto_params
        params.require(:producto).permit(:Nombre, :Descripcion, :Precio, :photo)
  end

  def producto
    @producto = Producto.find(params[:id])
  end
end
