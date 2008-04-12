class ColumnNameFix < ActiveRecord::Migration
   def self.up
      rename_column :usuario_perfis, :empresa_id, :perfil_id
      remove_column :lancamentos, :previsao_id
   end

   def self.down
      add_column :lancamentos, :previsao_id, :integer, :null => false
      rename_column :usuario_perfis, :perfil_id, :empresa_id
   end
end
