class PostSearch < ApplicationRecord

  include SqliteSearch

  search_scope(:Nombre, :Descripcion)

end
