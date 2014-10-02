ActiveRecord::Schema.define(version: 20141002161141) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "complaints", force: true do |t|
    t.string   "complaint_number"
    t.string   "status"
    t.string   "date_entered"
    t.string   "house_number"
    t.string   "house_street"
    t.string   "inspection_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
  end

end
