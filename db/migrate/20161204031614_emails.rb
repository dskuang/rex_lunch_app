class Emails < ActiveRecord::Migration[5.0]
  def change
    create_table "emails", force: :cascade do |t|
      t.datetime "created_at",    null: false
      t.datetime "updated_at",    null: false
      t.string   "group_name"
      t.string   "address"
    end
  end
end
