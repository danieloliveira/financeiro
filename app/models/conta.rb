class Conta < ActiveRecord::Base
  #Relationships
  belongs_to :empresa
  belongs_to :conta
  belongs_to :tipo_conta
  
  #Validations
  validates_presence_of :removido
  
  
  validates_associated :empresa, :allow_nil => true 
  validates_associated :conta, :allow_nil => true 
  validates_associated :tipo_conta, :allow_nil => true 
  
  
end
