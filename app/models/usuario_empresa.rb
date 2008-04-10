# == Schema Information
# Schema version: 20080410155917
#
# Table name: usuario_empresas
#
#  id         :integer       not null, primary key
#  usuario_id :integer       not null
#  empresa_id :integer       not null
#  removido   :boolean       not null
#  created_at :datetime      
#  updated_at :datetime      
#

class UsuarioEmpresa < ActiveRecord::Base
  #Relationships
  belongs_to :usuario
  belongs_to :empresa
  
  #Validations
  validates_presence_of :removido
  validates_associated :usuario, :allow_nil => true 
  validates_associated :empresa, :allow_nil => true 
end
