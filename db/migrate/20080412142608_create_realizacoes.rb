class CreateRealizacoes < ActiveRecord::Migration
   def self.up
      remove_column :realizacoes, :lancamento_id
      add_column :realizacoes, :valor_previsto, :decimal, :precision => 14, :scale => 2, :null => false, :default => 0
      add_column :realizacoes, :valor_realizado, :decimal, :precision => 14, :scale => 2, :null => false, :default => 0
      add_column :lancamentos, :realizacao_id, :integer
      add_column :tipo_contas, :lancamento_padrao_debito, :boolean, :null => false, :default => false, :default => 0
      remove_column :previsoes, :fim
      add_column :previsoes, :empresa_id, :integer, :null => false, :default => 0
      add_column :previsoes, :usuario_id, :integer, :null => false, :default => 0
      add_column :previsoes, :origem_id, :integer, :null => false, :default => 0
      add_column :previsoes, :destino_id, :integer, :null => false, :default => 0
      change_column :lancamentos, :data, :datetime
   end

   def self.down
      change_column :lancamentos, :data
      remove_column :previsoes, :destino_id
      remove_column :previsoes, :origem_id
      remove_column :previsoes, :cliente_id
      remove_column :previsoes, :usuario_id
      remove_column :previsoes, :empresa_id
      add_column :previsoes, :fim, :date
      remove_column :tipo_contas, :lancamento_padrao_debito
      remove_column :lancamentos, :realizacao_id
      remove_column :realizacoes, :valor_realizado
      remove_column :realizacoes, :valor_previsto
      add_column :realizacoes, :lancamento_id, :integer
   end
end
