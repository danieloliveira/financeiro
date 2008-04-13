class PrevisaoSemOrigemOuDestino < ActiveRecord::Migration
  def self.up
    change_column :previsoes, :destino_id, :integer, :null => true
    change_column :previsoes, :origem_id, :integer, :null => true
  end

  def self.down
  end
end
