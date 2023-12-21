class ProductChannel < ApplicationCable::Channel
  def subscribed
    stream_from "producto_#{params[:room]}"
  end
end
