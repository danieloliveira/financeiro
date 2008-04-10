# == Schema Information
# Schema version: 20080410155917
#
# Table name: previsoes
#
#  id         :integer       not null, primary key
#  inicio     :date          not null
#  tipo       :integer       default(0), not null
#  periodo    :integer       default(1), not null
#  fim        :date          
#  nome       :string(255)   not null
#  descricao  :text          
#  removido   :boolean       not null
#  created_at :datetime      
#  updated_at :datetime      
#

class Previsao < ActiveRecord::Base
  #Relationships
  has_many :realizacoes
  has_many :lancamentos, :through => :realizacoes
  
  #Validations
  validates_presence_of :inicio, :tipo, :periodo, :nome, :removido
  validates_numericality_of :tipo, :periodo, :allow_nil => true
  validates_length_of :nome, :maximum => 255, :allow_nil => true
end
