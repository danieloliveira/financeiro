class UniqueIndexes < ActiveRecord::Migration
  def self.up
    add_index :empresas, :nome, :unique => true
    add_index :usuarios, :nome, :unique => true
    add_index :perfis, :nome, :unique => true
    add_index :tipo_contas, :nome, :unique => true
    add_index :tipo_documentos, :nome, :unique => true
  end

  def self.down
    remove_index :tipo_documentos, :column => :nome
    remove_index :tipo_contas, :column => :nome
    remove_index :perfis, :column => :nome
    remove_index :usuarios, :column => :nome
    remove_index :empresas, :column => :nome
  end
end
