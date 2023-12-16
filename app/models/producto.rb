class Producto < ApplicationRecord
  has_one_attached :photo
  validates :Nombre, presence: true
  validates :Descripcion, presence: true
  validates :Precio, presence: true

  belongs_to :category
end
