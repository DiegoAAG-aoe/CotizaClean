class FavoritosController < ApplicationController
  def index

  end

  def create
    producto.favorito!(user: Current.user)
    respond_to do |format|
      format.html do
        redirect_to producto_path(producto)
      end
    end
  end

  def destroy
    producto.unfavorito!
    respond_to do |format|
      format.html do
        redirect_to producto_path(producto), status: :see_other
      end
    end
  end

  private

  def producto
    @producto ||= Producto.find(params[:producto_id])
  end
end
