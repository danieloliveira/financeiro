class MoreColumns < ActiveRecord::Migration
   def self.up
      add_column :lancamentos, :valor, :decimal,   :precision => 14, :scale => 2
      add_column :previsoes, :cliente_id, :integer, :null => true
      add_column :previsoes, :numero_parcela, :integer, :null => true
      add_column :previsoes,  :valor, :decimal,   :precision => 14, :scale => 2
   end

   def self.down
      remove_column :previsoes,  :valor
      remove_column :previsoes, :numero_parcela
      remove_column :previsoes, :cliente_id
      remove_column :lancamentos, :valor
   end
end
