# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 1) do

  create_table "clientes", :force => true do |t|
    t.string   "nome",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contas", :force => true do |t|
    t.integer  "empresa_id"
    t.integer  "conta_id"
    t.integer  "tipo_conta_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "empresas", :force => true do |t|
    t.string   "nome",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "lancamento", :force => true do |t|
    t.integer  "cliente_id"
    t.integer  "empresa_id",  :null => false
    t.integer  "origem_id"
    t.integer  "destino_id"
    t.integer  "grupo_id"
    t.integer  "previsao_id"
    t.date     "data",        :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "perfis", :force => true do |t|
    t.string   "nome",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "previsoes", :force => true do |t|
    t.date     "inicio",                    :null => false
    t.integer  "tipo",       :default => 0, :null => false
    t.integer  "periodo",    :default => 1, :null => false
    t.date     "fim"
    t.string   "nome",                      :null => false
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sumarizacao_contas", :force => true do |t|
    t.integer  "conta_id",   :null => false
    t.integer  "usuario_id", :null => false
    t.date     "data",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tipo_contas", :force => true do |t|
    t.string   "nome",                          :null => false
    t.boolean  "debito",     :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuario_empresas", :force => true do |t|
    t.integer  "usuario_id", :null => false
    t.integer  "empresa_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuario_perfis", :force => true do |t|
    t.integer  "usuario_id", :null => false
    t.integer  "empresa_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nome",       :null => false
    t.string   "senha",      :null => false
    t.string   "email",      :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
