class ProductosController < ApplicationController
  def index
    pp params[:category_id]
    @categories = Category.order(name: :asc).load_async
    @productos = Producto.with_attached_photo.order(created_at: :desc).load_async
    if params[:category_id]
      @productos = @productos.where(category_id: params[:category_id])
    end
    if params[:min_price].present?
      @productos = @productos.where("Precio >= ?", params[:min_price])
    end  
    if params[:max_price].present?
      @productos = @productos.where("Precio <= ?", params[:max_price])
    end  
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
