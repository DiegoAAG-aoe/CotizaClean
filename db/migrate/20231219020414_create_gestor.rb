class CreateGestor < ActiveRecord::Migration[7.1]
  def change
    create_table :gestors do |t|
        t.text :Nombre
        t.string :Tipo
        t.integer :Precio
        t.text :Descripcion
        t.text :Marca

      t.timestamps
    end
  end
end
