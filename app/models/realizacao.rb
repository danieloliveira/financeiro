# == Schema Information
# Schema version: 20080412171520
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
  
  #Validations
  validates_presence_of :valor_previsto, :valor_realizado
  validates_numericality_of :valor_previsto, :valor_realizado, :allow_nil => true
  validates_length_of :valor_previsto, :maximum => 14, :allow_nil => true
  validates_length_of :valor_realizado, :maximum => 14, :allow_nil => true
  
  validates_associated :previsao, :allow_nil => true 
  
  
end
