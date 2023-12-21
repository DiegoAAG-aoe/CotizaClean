class FavoritosController < ApplicationController
    def index

    end

    def create
      producto.favoritos.create(user: current_user)
      redirect_to producto_path(producto)
    end

    def destroy
      producto.favoritos.find_by(user: current_user).destroy
      redirect_to producto_path(producto), status: :see_other
    end

    private

    def producto
      @producto ||= Producto.find(params[:producto_id])
    end
end
