class AddNullFalseToProductoFields < ActiveRecord::Migration[7.1]
  def change
    change_column_null :productos, :Nombre, false
    change_column_null :productos, :Descripcion, false
    change_column_null :productos, :precio, false
  end
end
