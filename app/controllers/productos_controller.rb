class ProductosController < ApplicationController
  def index
    @categories = Category.order(name: :asc).load_async
    @pagy, @productos = pagy_countless(FindProductos.new.call(producto_params_index).load_async, items: 6)
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
      render :new
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
    params.require(:producto).permit(:Nombre, :Tipo, :Descripcion, :precio, :Marca, :photo)
  end

  def producto_params_index
    params.permit(:category_id, :min_price, :max_price, :query_text, :order_by, :page, :favoritos)
  end

  def producto
    @producto = Producto.find(params[:id])
  end
end
