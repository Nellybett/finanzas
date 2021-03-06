# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120927023616) do

  create_table "egress_events", :force => true do |t|
    t.integer  "egress_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "egress_events", ["egress_id"], :name => "index_egress_events_on_egress_id"
  add_index "egress_events", ["event_id"], :name => "index_egress_events_on_event_id"

  create_table "egresses", :force => true do |t|
    t.integer  "user_id"
    t.string   "reason"
    t.string   "amount"
    t.string   "type_of_Payment"
    t.string   "operation_Number"
    t.date     "date"
    t.string   "invoice_Number"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "egresses", ["user_id"], :name => "index_egresses_on_user_id"

  create_table "eps", :force => true do |t|
    t.string   "ep_Id"
    t.string   "ep_Name"
    t.string   "ep_Lastname"
    t.string   "program"
    t.string   "ep_Manager_Name"
    t.string   "ep_Manager_Email"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "eps", ["user_id"], :name => "index_eps_on_user_id"

  create_table "events", :force => true do |t|
    t.string   "name"
    t.date     "event_Date"
    t.text     "oc"
    t.text     "description"
    t.text     "recomendations"
    t.string   "profit"
    t.string   "expense"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "events", ["user_id"], :name => "index_events_on_user_id"

  create_table "income_eps", :force => true do |t|
    t.integer  "income_id"
    t.integer  "ep_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "income_eps", ["ep_id"], :name => "index_income_eps_on_ep_id"
  add_index "income_eps", ["income_id"], :name => "index_income_eps_on_income_id"

  create_table "income_events", :force => true do |t|
    t.integer  "income_id"
    t.integer  "event_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "income_events", ["event_id"], :name => "index_income_events_on_event_id"
  add_index "income_events", ["income_id"], :name => "index_income_events_on_income_id"

  create_table "income_tns", :force => true do |t|
    t.integer  "income_id"
    t.integer  "tn_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "income_tns", ["income_id"], :name => "index_income_tns_on_income_id"
  add_index "income_tns", ["tn_id"], :name => "index_income_tns_on_tn_id"

  create_table "incomes", :force => true do |t|
    t.integer  "user_id"
    t.string   "reason"
    t.string   "amount"
    t.string   "type_of_Payment"
    t.string   "operation_Number"
    t.date     "deposit_Date"
    t.string   "invoice_Number"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "incomes", ["user_id"], :name => "index_incomes_on_user_id"

  create_table "requests", :force => true do |t|
    t.string   "reason"
    t.string   "amount"
    t.date     "request_Date"
    t.string   "name"
    t.string   "identification"
    t.string   "account_Type"
    t.string   "acount_Number"
    t.string   "bank"
    t.string   "para"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.string   "status"
  end

  add_index "requests", ["user_id"], :name => "index_requests_on_user_id"

  create_table "tns", :force => true do |t|
    t.string   "tn_Id"
    t.string   "tn_Taker"
    t.string   "tn_Name"
    t.string   "program"
    t.string   "tn_Manager_Name"
    t.string   "tn_Manager_Email"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "tns", ["user_id"], :name => "index_tns_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "first_Name"
    t.string   "last_Name"
    t.string   "committee"
    t.string   "password"
    t.integer  "phone"
    t.string   "role"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
