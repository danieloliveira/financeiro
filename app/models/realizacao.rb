# == Schema Information
# Schema version: 20080412190825
#
# Table name: realizacoes
#
#  id              :integer       not null, primary key
#  previsao_id     :integer       
#  data            :date          
#  valor_previsto  :decimal(14, 2 default(0.0), not null
#  valor_realizado :decimal(14, 2 default(0.0), not null
#  valor_desconto  :decimal(14, 2 default(0.0), not null
#

class Realizacao < ActiveRecord::Base
   usar_como_dinheiro :valor_realizado, :valor_previsto, :valor_desconto
  #Relationships
  belongs_to :previsao
  has_many :lancamentos
end
