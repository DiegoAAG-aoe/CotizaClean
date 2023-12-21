class CreateFavoritos < ActiveRecord::Migration[7.1]
  def change
    create_table :favoritos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :producto, null: false, foreign_key: true

      t.timestamps
    end

    add_index :favoritos,  [:user_id, :producto_id], unique: true
  end
end
