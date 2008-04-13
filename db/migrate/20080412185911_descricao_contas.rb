class DescricaoContas < ActiveRecord::Migration
  def self.up
    add_column :contas, :nome, :string, :null => false, :default => ''
  end

  def self.down
    remove_column :contas, :nome
  end
end
