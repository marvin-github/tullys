# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181217011906) do

  create_table "breeders", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company_name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "mobile_phone"
    t.string "home_phone"
    t.string "fax"
    t.string "usda_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "breeds", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brokers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company_name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "mobile_phone"
    t.string "home_phone"
    t.string "fax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "canine_treatment_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "canine_id"
    t.bigint "treatment_type_id"
    t.date "treatment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["canine_id"], name: "index_canine_treatment_types_on_canine_id"
    t.index ["treatment_type_id"], name: "index_canine_treatment_types_on_treatment_type_id"
  end

  create_table "canines", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "litter_id"
    t.string "micro_chip_number"
    t.integer "gender_id"
    t.string "color"
    t.string "arrival_weight"
    t.bigint "weight_category_id"
    t.string "sale_weight"
    t.decimal "price", precision: 8, scale: 2
    t.decimal "sale_price", precision: 8, scale: 2
    t.string "fault_description"
    t.decimal "fault_discount", precision: 8, scale: 2
    t.bigint "registration_company_id"
    t.string "on_hold"
    t.string "on_hold_reason"
    t.date "available_date"
    t.date "last_sold_date"
    t.decimal "cost", precision: 8, scale: 2
    t.bigint "sale_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description", limit: 100
    t.string "registration_number", limit: 45
    t.index ["litter_id"], name: "index_canines_on_litter_id"
    t.index ["registration_company_id"], name: "index_canines_on_registration_company_id"
    t.index ["sale_status_id"], name: "index_canines_on_sale_status_id"
    t.index ["weight_category_id"], name: "index_canines_on_weight_category_id"
  end

  create_table "compensation_types", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 45
  end

  create_table "customer_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 45
  end

  create_table "customers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company_name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "mobile_phone"
    t.string "home_phone"
    t.string "email"
    t.string "fax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "dams", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.bigint "breed_id"
    t.bigint "breeder_id"
    t.string "registration_number"
    t.bigint "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.binary "comment"
    t.index ["breed_id"], name: "index_dams_on_breed_id"
    t.index ["breeder_id"], name: "index_dams_on_breeder_id"
    t.index ["picture_id"], name: "index_dams_on_picture_id"
  end

  create_table "genders", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "code", limit: 45
    t.string "name", limit: 45
  end

  create_table "invoice_histories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "invoice_id"
    t.date "purchase_date"
    t.decimal "sale_discount", precision: 10, scale: 2
    t.decimal "sale_price", precision: 10, scale: 2
    t.decimal "total_price", precision: 10, scale: 2
    t.date "return_date"
    t.decimal "refund_amount", precision: 10, scale: 2
    t.string "invoice_status", limit: 55
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_histories_on_invoice_id"
  end

  create_table "invoice_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "code", limit: 45
    t.string "name"
  end

  create_table "invoices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "customer_id"
    t.bigint "canine_id"
    t.date "purchase_date"
    t.decimal "sale_discount", precision: 10, scale: 2
    t.decimal "sale_price", precision: 10, scale: 2
    t.string "sale_discount_reason"
    t.string "paper_deliver_method"
    t.string "credit_card_last_4"
    t.string "credit_card2_last_4", limit: 45
    t.integer "payment_method_1"
    t.integer "payment_method_2"
    t.decimal "payment_amount_1", precision: 10, scale: 2
    t.decimal "payment_amount_2", precision: 10, scale: 2
    t.date "payment_date"
    t.bigint "veterinarian_id"
    t.integer "sales_person_1"
    t.integer "sales_person_2"
    t.decimal "commission_percent", precision: 10, scale: 2
    t.date "return_date"
    t.decimal "refund_amount", precision: 10, scale: 2
    t.string "refund_method"
    t.string "return_reason"
    t.string "sale_completed"
    t.integer "invoice_status_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["canine_id"], name: "index_invoices_on_canine_id"
    t.index ["customer_id"], name: "index_invoices_on_customer_id"
    t.index ["veterinarian_id"], name: "index_invoices_on_veterinarian_id"
  end

  create_table "litter_treatment_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "litter_id"
    t.bigint "treatment_type_id"
    t.date "treatment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["litter_id"], name: "index_litter_treatment_types_on_litter_id"
    t.index ["treatment_type_id"], name: "index_litter_treatment_types_on_treatment_type_id"
  end

  create_table "litter_treatments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "litter_id"
    t.bigint "treatment_type_id"
    t.date "treatment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["litter_id"], name: "index_litter_treatments_on_litter_id"
    t.index ["treatment_type_id"], name: "index_litter_treatments_on_treatment_type_id"
  end

  create_table "litters", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.date "arrival_date"
    t.date "available_date"
    t.date "birth_date"
    t.bigint "breed_id"
    t.bigint "breeder_id"
    t.bigint "dam_id"
    t.bigint "sire_id"
    t.integer "male_count"
    t.integer "female_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", limit: 100
    t.index ["breed_id"], name: "index_litters_on_breed_id"
    t.index ["dam_id"], name: "index_litters_on_dam_id"
    t.index ["sire_id"], name: "index_litters_on_sire_id"
  end

  create_table "payment_methods", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
  end

  create_table "pictures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.binary "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "registration_companies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company_name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "mobile_phone"
    t.string "home_phone"
    t.string "fax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "requirements", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.date "start_date"
    t.string "name"
    t.text "description"
    t.text "detail"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "last_update_by", limit: 45
  end

  create_table "return_reasons", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sale_invoices", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "litter_id", limit: 45
    t.integer "canine_treatment_id"
    t.string "micro_chip_numer", limit: 45
    t.string "gender", limit: 45
    t.integer "arrival_weight"
    t.integer "weight_category_id"
    t.integer "sale_weight"
    t.integer "price"
    t.integer "sale_price"
    t.string "fault_description", limit: 45
    t.integer "fault_discount"
    t.string "registration_company", limit: 45
    t.string "registration_number", limit: 45
    t.integer "on_hold", limit: 1
    t.integer "on_hold_reason_id"
    t.datetime "availability_date"
    t.datetime "last_sold_date"
    t.integer "cost"
    t.integer "sold_to_id"
    t.integer "sale_info_id"
  end

  create_table "sale_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "description", limit: 100
  end

  create_table "sales_people", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "sales_plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sales_plan_id"], name: "index_sales_people_on_sales_plan_id"
  end

  create_table "sales_plans", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.date "start_date"
    t.date "end_date"
    t.decimal "variable_percent", precision: 8, scale: 2
    t.decimal "flat_percent", precision: 8, scale: 2
    t.decimal "flat_amount", precision: 8, scale: 2
    t.decimal "max_amount", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name", limit: 45
  end

  create_table "sires", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.bigint "breed_id"
    t.bigint "breeder_id"
    t.string "registration_number"
    t.bigint "picture_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.binary "comment"
    t.index ["breed_id"], name: "index_sires_on_breed_id"
    t.index ["breeder_id"], name: "index_sires_on_breeder_id"
    t.index ["picture_id"], name: "index_sires_on_picture_id"
  end

  create_table "treatment_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.bigint "canine_id"
    t.bigint "treatment_type_id"
    t.date "treatment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["canine_id"], name: "index_treatments_on_canine_id"
    t.index ["treatment_type_id"], name: "index_treatments_on_treatment_type_id"
  end

  create_table "users", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", limit: 100
    t.string "email", limit: 100
    t.string "password_digest", limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "access", limit: 45
    t.string "admin", limit: 45
  end

  create_table "veterinarians", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company_name"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "mobile_phone"
    t.string "home_phone"
    t.string "fax"
    t.string "business_hours"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weight_categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "description"
    t.string "require_sale_weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "canine_treatment_types", "canines"
  add_foreign_key "canine_treatment_types", "treatment_types"
  add_foreign_key "canines", "litters"
  add_foreign_key "canines", "registration_companies"
  add_foreign_key "canines", "sale_statuses"
  add_foreign_key "canines", "weight_categories"
  add_foreign_key "dams", "breeders"
  add_foreign_key "dams", "breeds"
  add_foreign_key "dams", "pictures"
  add_foreign_key "invoices", "canines"
  add_foreign_key "invoices", "customers"
  add_foreign_key "invoices", "veterinarians"
  add_foreign_key "litter_treatment_types", "litters"
  add_foreign_key "litter_treatment_types", "treatment_types"
  add_foreign_key "litter_treatments", "litters"
  add_foreign_key "litter_treatments", "treatment_types"
  add_foreign_key "litters", "breeds"
  add_foreign_key "litters", "dams"
  add_foreign_key "litters", "sires"
  add_foreign_key "sales_people", "sales_plans"
  add_foreign_key "sires", "breeders"
  add_foreign_key "sires", "breeds"
  add_foreign_key "sires", "pictures"
  add_foreign_key "treatments", "canines"
  add_foreign_key "treatments", "treatment_types"
end
