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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150507184358) do

  create_table "compras", force: true do |t|
    t.string   "pin"
    t.integer  "empleado_id"
    t.integer  "proyecto_id"
    t.integer  "solicitud_id"
    t.boolean  "aprobar",      default: false
    t.float    "total"
    t.integer  "proveedor_id"
    t.float    "sub_total"
    t.float    "iva"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "empleados", force: true do |t|
    t.string   "nombre"
    t.string   "email"
    t.boolean  "status",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "empleados", ["email"], name: "index_empleados_on_email", unique: true

  create_table "productos", force: true do |t|
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "uso"
    t.integer  "cantidad"
    t.float    "precio"
    t.string   "unidad"
    t.integer  "solicitud_id"
    t.integer  "compra_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "total"
    t.boolean  "aprobar",            default: false
    t.float    "precio_compra"
    t.string   "unidad_compra"
    t.float    "total_compra"
    t.string   "descripcion_compra"
    t.integer  "cantidad_compra"
  end

  create_table "proveedors", force: true do |t|
    t.string   "empresa"
    t.string   "nombre"
    t.string   "direccion"
    t.string   "cp"
    t.string   "telefono"
    t.string   "rfc"
    t.string   "contacto"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proyectos", force: true do |t|
    t.string   "nombre"
    t.boolean  "status",     default: true
    t.string   "pin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "solicituds" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "usuarios", force: true do |t|
    t.string   "nombre"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.boolean  "admin",           default: false
  end

  add_index "usuarios", ["email"], name: "index_usuarios_on_email", unique: true

end
