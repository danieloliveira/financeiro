# == Schema Information
# Schema version: 20080411000613
#
# Table name: tipo_documentos
#
#  id         :integer       not null, primary key
#  nome       :string(255)   not null
#  removido   :boolean       not null
#  created_at :datetime      
#  updated_at :datetime      
#

class TipoDocumento < ActiveRecord::Base
  #Relationships
  has_many :lancamentos
  
  #Validations
  validates_presence_of :nome, :removido
  validates_uniqueness_of :nome
  validates_length_of :nome, :maximum => 255, :allow_nil => true
end
