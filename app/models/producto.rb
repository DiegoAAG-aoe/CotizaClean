class Producto < ApplicationRecord

  include PgSearch::Model
  include Favoritable

  pg_search_scope :search_full_text, against: {
    Nombre: 'A',
    Descripcion: 'B',
    Marca: 'C'
  }

  ORDER_BY = {
    newest: "created_at DESC",
    expensive: "precio DESC",
    cheapest: "precio ASC"
  }

  has_one_attached :photo
  validates :Nombre, presence: true
  validates :Descripcion, presence: true
  validates :precio, presence: true

  belongs_to :category
  belongs_to :user, default: -> { Current.user }

  def owner?
    user_id == Current.user&.id
  end
end
