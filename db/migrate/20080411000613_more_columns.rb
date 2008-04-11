class MoreColumns < ActiveRecord::Migration
  def self.up
    add_column :lancamentos, :valor, :decimal,   :precision => 14, :scale => 2
    add_column :previsao, :cliente_id, :integer, :null => true
    add_column :previsao, :numero_parcela, :integer, :null => true
    add_column :previsao,  :valor, :decimal,   :precision => 14, :scale => 2
  end

  def self.down
  end
end
