class ProductosController < ApplicationController
  def index
    @productos = Producto.all
  end
  def show
        @producto = Producto.find(params[:id])
  end
end
