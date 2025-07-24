# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2025_07_23_203838) do
  create_table "active_prompt_parameters", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "default_value"
    t.text "description"
    t.string "example_value"
    t.string "name", null: false
    t.string "parameter_type", default: "string", null: false
    t.integer "position"
    t.integer "prompt_id", null: false
    t.boolean "required", default: true, null: false
    t.datetime "updated_at", null: false
    t.json "validation_rules"
    t.index ["position"], name: "index_active_prompt_parameters_on_position"
    t.index ["prompt_id", "name"], name: "index_active_prompt_parameters_on_prompt_id_and_name", unique: true
    t.index ["prompt_id"], name: "index_active_prompt_parameters_on_prompt_id"
  end

  create_table "active_prompt_prompt_versions", force: :cascade do |t|
    t.text "change_description"
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.string "created_by"
    t.integer "max_tokens"
    t.json "metadata"
    t.string "model"
    t.integer "prompt_id", null: false
    t.text "system_message"
    t.float "temperature"
    t.datetime "updated_at", null: false
    t.integer "version_number", null: false
    t.index ["prompt_id", "version_number"], name: "index_prompt_versions_on_prompt_and_version", unique: true
    t.index ["prompt_id"], name: "index_active_prompt_prompt_versions_on_prompt_id"
    t.index ["version_number"], name: "index_active_prompt_prompt_versions_on_version_number"
  end

  create_table "active_prompt_prompts", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.text "description"
    t.integer "max_tokens"
    t.json "metadata"
    t.string "model"
    t.string "name"
    t.string "status"
    t.text "system_message"
    t.float "temperature"
    t.datetime "updated_at", null: false
    t.integer "versions_count", default: 0, null: false
  end

  add_foreign_key "active_prompt_parameters", "active_prompt_prompts", column: "prompt_id"
  add_foreign_key "active_prompt_prompt_versions", "active_prompt_prompts", column: "prompt_id"
end
