class TipoConta < ActiveRecord::Base
  #Relationships
  
  #Validations
  validates_presence_of :nome, :debito, :removido
  
  validates_length_of :nome, :maximum => 255, :allow_nil => true
  
  
  
end
