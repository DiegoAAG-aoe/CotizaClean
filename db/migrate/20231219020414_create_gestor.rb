class CreateGestor < ActiveRecord::Migration[7.1]
  def change
    create_table "gestors", force: :cascade do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "full_name"
      t.string "uid"
      t.string "avatar_url"
      t.string "provider"
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer "tipo"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["email"], name: "index_gestors_on_email", unique: true
      t.index ["reset_password_token"], name: "index_gestors_on_reset_password_token", unique: true
    end
  end
end
