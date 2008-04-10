class Previsao < ActiveRecord::Base
  #Relationships
  
  #Validations
  validates_presence_of :inicio, :tipo, :periodo, :nome, :removido
  validates_numericality_of :tipo, :periodo, :allow_nil => true
  validates_length_of :nome, :maximum => 255, :allow_nil => true
  
  
  
end
