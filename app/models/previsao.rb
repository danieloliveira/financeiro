# == Schema Information
# Schema version: 20080411000613
#
# Table name: previsoes
#
#  id             :integer       not null, primary key
#  inicio         :date          not null
#  tipo           :integer       default(0), not null
#  periodo        :integer       default(1), not null
#  fim            :date          
#  nome           :string(255)   not null
#  descricao      :text          
#  removido       :boolean       not null
#  created_at     :datetime      
#  updated_at     :datetime      
#  cliente_id     :integer       
#  numero_parcela :integer       
#  valor          :decimal(14, 2 
#

class Previsao < ActiveRecord::Base
  #Relationships
  has_many :realizacoes
  has_many :lancamentos, :through => :realizacoes
  belongs_to :cliente
  
  #Validations
  validates_presence_of :inicio, :tipo, :periodo, :nome, :removido
  validates_numericality_of :tipo, :periodo, :allow_nil => true
  validates_length_of :nome, :maximum => 255, :allow_nil => true
  
end
