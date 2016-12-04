class SecretTable < ActiveRecord::Migration[5.0]
  def change
    create_table "technologies", force: :cascade do |t|
      t.datetime "created_at",    null: false
      t.datetime "updated_at",    null: false
      t.string   "name"
      t.json     "auth_data"
    end
  end
end
