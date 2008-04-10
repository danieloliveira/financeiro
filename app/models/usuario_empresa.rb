class UsuarioEmpresa < ActiveRecord::Base
  #Relationships
  belongs_to :usuario
  belongs_to :empresa
  
  #Validations
  validates_presence_of :removido
  
  
  validates_associated :usuario, :allow_nil => true 
  validates_associated :empresa, :allow_nil => true 
  
  
end
