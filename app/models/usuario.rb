class Usuario < ActiveRecord::Base
  #Relationships
  
  #Validations
  validates_presence_of :nome, :senha, :email, :removido
  
  validates_length_of :nome, :maximum => 255, :allow_nil => true
  validates_length_of :email, :maximum => 255, :allow_nil => true
  validates_length_of :senha, :maximum => 255, :allow_nil => true
  
  
  
end
