class Cliente < ActiveRecord::Base
  #Relationships
  belongs_to :empresa
  
  #Validations
  validates_presence_of :nome, :removido
  
  validates_length_of :nome, :maximum => 255, :allow_nil => true
  
  validates_associated :empresa, :allow_nil => true 
  
  
end
