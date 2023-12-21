class FavoritosController < ApplicationController
  def index

  end

  def create
    producto.favorito!
    redirect_to producto_path(producto)
  end

  def destroy
    producto.unfavorito!
    redirect_to producto_path(producto), status: :see_other
  end

  private

  def producto
    @producto ||= Producto.find(params[:producto_id])
  end
end
