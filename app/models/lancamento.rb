class Lancamento < ActiveRecord::Base
  #Relationships
  belongs_to :cliente
  belongs_to :empresa
  belongs_to :origem
  belongs_to :destino
  belongs_to :grupo
  belongs_to :previsao
  belongs_to :tipo_documento
  
  #Validations
  validates_presence_of :data, :removido
  
  
  validates_associated :cliente, :allow_nil => true 
  validates_associated :empresa, :allow_nil => true 
  validates_associated :origem, :allow_nil => true 
  validates_associated :destino, :allow_nil => true 
  validates_associated :grupo, :allow_nil => true 
  validates_associated :previsao, :allow_nil => true 
  validates_associated :tipo_documento, :allow_nil => true 
  
  
end
