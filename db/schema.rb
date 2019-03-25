ActiveRecord::Schema.define(version: 20190322041205) do

  create_table "properties", force: :cascade do |t|
    t.string   "name"
    t.integer  "rent"
    t.string   "address"
    t.integer  "age"
    t.text     "remark"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stations", force: :cascade do |t|
    t.string   "route"
    t.string   "name"
    t.integer  "walking_minute"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "property_id"
    t.index ["property_id"], name: "index_stations_on_property_id"
  end

end
