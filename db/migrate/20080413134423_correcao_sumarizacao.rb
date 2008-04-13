class CorrecaoSumarizacao < ActiveRecord::Migration
  def self.up
    change_column :sumarizacao_contas, :data, :datetime
  end

  def self.down
  end
end
