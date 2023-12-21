class ApplicationController < ActionController::Base
  include Pagy::Backend

  def authorize! producto
        produco.user_id == Current.user.id
  end
end
