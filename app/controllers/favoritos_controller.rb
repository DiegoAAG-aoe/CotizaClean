class FavoritosController < ApplicationController
  def index

  end

  def create
    producto.favorite!
    respond_to do |format|
      format.html do
        redirect_to producto_path(producto)
      end
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(" favorito ", partial: "productos/favorito", locals: { producto: producto })
      end

    end
  end

  def destroy
    producto.unfavorite!
    respond_to do |format|
      format.html do
        redirect_to producto_path(producto), status: :see_other
      end
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(" favorito ", partial: "productos/favorito", locals: { producto: producto })
      end
    end
  end

  private

  def producto
    @producto ||= Producto.find(params[:producto_id])
  end
end
