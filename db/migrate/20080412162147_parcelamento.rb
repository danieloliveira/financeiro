class Parcelamento < ActiveRecord::Migration
  def self.up
   add_column :lancamentos, :numero_parcela, :integer, :null => true
   add_column :realizacoes, :valor_desconto, :decimal, :precision => 14, :scale => 2, :null => false, :default => 0
  end

  def self.down
   remove_column :realizacoes, :valor_desconto
   remove_column :lancamentos, :numero_parcela
  end
end
