class CreateProductos < ActiveRecord::Migration[7.1]
  def change
    create_table :productos do |t|
      t.text :Nombre
      t.string :Tipo
      t.integer :precio
      t.text :Descripcion
      t.text :Marca

      t.timestamps
    end
  end
end
