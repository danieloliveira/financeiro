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

ActiveRecord::Schema.define(:version => 20080413134423) do

  create_table "clientes", :force => true do |t|
    t.string   "nome",                          :null => false
    t.integer  "empresa_id",                    :null => false
    t.boolean  "removido",   :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contas", :force => true do |t|
    t.integer  "empresa_id"
    t.integer  "conta_id"
    t.integer  "tipo_conta_id",                    :null => false
    t.boolean  "removido",      :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "nome",          :default => "",    :null => false
  end

  create_table "empresas", :force => true do |t|
    t.string   "nome",                          :null => false
    t.boolean  "removido",   :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "empresas", ["nome"], :name => "index_empresas_on_nome", :unique => true

  create_table "lancamentos", :force => true do |t|
    t.integer  "cliente_id"
    t.integer  "empresa_id",                           :null => false
    t.integer  "origem_id"
    t.integer  "destino_id"
    t.integer  "grupo_id"
    t.datetime "data",                                 :null => false
    t.integer  "tipo_documento_id"
    t.boolean  "removido",          :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "valor"
    t.integer  "realizacao_id"
    t.integer  "numero_parcela"
  end

  create_table "perfis", :force => true do |t|
    t.string   "nome",                          :null => false
    t.boolean  "removido",   :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "perfis", ["nome"], :name => "index_perfis_on_nome", :unique => true

  create_table "previsoes", :force => true do |t|
    t.date     "inicio",                            :null => false
    t.integer  "tipo",           :default => 0,     :null => false
    t.integer  "periodo",        :default => 1,     :null => false
    t.string   "nome",                              :null => false
    t.text     "descricao"
    t.boolean  "removido",       :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cliente_id"
    t.integer  "numero_parcela"
    t.decimal  "valor"
    t.integer  "empresa_id",     :default => 0,     :null => false
    t.integer  "usuario_id",     :default => 0,     :null => false
    t.integer  "origem_id",      :default => 0
    t.integer  "destino_id",     :default => 0
  end

  create_table "realizacoes", :force => true do |t|
    t.integer "previsao_id"
    t.date    "data"
    t.decimal "valor_previsto",  :precision => 14, :scale => 2, :default => 0.0, :null => false
    t.decimal "valor_realizado", :precision => 14, :scale => 2, :default => 0.0, :null => false
    t.decimal "valor_desconto",  :precision => 14, :scale => 2, :default => 0.0, :null => false
  end

  create_table "sumarizacao_contas", :force => true do |t|
    t.integer  "conta_id",                      :null => false
    t.integer  "usuario_id",                    :null => false
    t.datetime "data",                          :null => false
    t.boolean  "removido",   :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "valor"
  end

  create_table "tipo_contas", :force => true do |t|
    t.string   "nome",                                        :null => false
    t.boolean  "debito",                   :default => false, :null => false
    t.boolean  "removido",                 :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "lancamento_padrao_debito", :default => false, :null => false
  end

  add_index "tipo_contas", ["nome"], :name => "index_tipo_contas_on_nome", :unique => true

  create_table "tipo_documentos", :force => true do |t|
    t.string   "nome",                          :null => false
    t.boolean  "removido",   :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tipo_documentos", ["nome"], :name => "index_tipo_documentos_on_nome", :unique => true

  create_table "usuario_empresas", :force => true do |t|
    t.integer  "usuario_id",                    :null => false
    t.integer  "empresa_id",                    :null => false
    t.boolean  "removido",   :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuario_perfis", :force => true do |t|
    t.integer  "usuario_id",                    :null => false
    t.integer  "perfil_id",                     :null => false
    t.boolean  "removido",   :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nome",                          :null => false
    t.string   "senha",                         :null => false
    t.string   "email",                         :null => false
    t.boolean  "removido",   :default => false, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usuarios", ["nome"], :name => "index_usuarios_on_nome", :unique => true

end
