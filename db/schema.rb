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

ActiveRecord::Schema.define(:version => 20110913045246) do

  create_table "comentarios", :force => true do |t|
    t.string   "autor"
    t.text     "conteudo"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "imovels", :force => true do |t|
    t.string   "cidade"
    t.string   "bairro"
    t.text     "local"
    t.integer  "numqt"
    t.integer  "numst"
    t.integer  "numgar"
    t.integer  "area"
    t.integer  "valor"
    t.integer  "valm2"
    t.date     "data"
    t.integer  "codigo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "indices", :force => true do |t|
    t.string   "endereco"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "numqt"
    t.integer  "valmed"
    t.integer  "valm2med"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "titulo"
    t.text     "conteudo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
