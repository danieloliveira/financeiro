# == Schema Information
# Schema version: 20080410155917
#
# Table name: lancamentos
#
#  id                :integer       not null, primary key
#  cliente_id        :integer       
#  empresa_id        :integer       not null
#  origem_id         :integer       
#  destino_id        :integer       
#  grupo_id          :integer       
#  previsao_id       :integer       
#  data              :date          not null
#  tipo_documento_id :integer       
#  removido          :boolean       not null
#  created_at        :datetime      
#  updated_at        :datetime      
#

class Lancamento < ActiveRecord::Base
  #Relationships
  belongs_to :cliente
  belongs_to :empresa
  belongs_to :origem
  belongs_to :destino
  belongs_to :grupo
  belongs_to :previsao
  belongs_to :tipo_documento
  has_many :realizacao
  
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
