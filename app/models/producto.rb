class Producto < ApplicationRecord

  include PgSearch::Model
  pg_search_scope :search_full_text, against: {
    Nombre: 'A',
    Descripcion: 'B',
    Marca: 'C'
  }

  ORDER_BY = {
    newest: "created_at DESC",
    expensive: "Precio DESC",
    cheapest: "Precio ASC"
  }

  has_one_attached :photo
  validates :Nombre, presence: true
  validates :Descripcion, presence: true
  validates :Precio, presence: true

  belongs_to :category

end
