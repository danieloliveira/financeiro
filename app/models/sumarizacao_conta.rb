class SumarizacaoConta < ActiveRecord::Base
  #Relationships
  belongs_to :conta
  belongs_to :usuario
  
  #Validations
  validates_presence_of :data, :removido
  
  
  validates_associated :conta, :allow_nil => true 
  validates_associated :usuario, :allow_nil => true 
  
  
end
