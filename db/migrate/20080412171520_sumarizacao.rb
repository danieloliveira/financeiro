class Sumarizacao < ActiveRecord::Migration
   def self.up
      add_column :sumarizacao_contas, :valor,  :decimal,   :precision => 14, :scale => 2
      change_column :sumarizacao_contas, :data, :datetime
   end

   def self.down
      remove_column :sumarizacao_contas, :valor
      change_column :sumarizacao_contas, :data, :time
   end
end
