# == Schema Information
# Schema version: 20080410155917
#
# Table name: usuario_perfis
#
#  id         :integer       not null, primary key
#  usuario_id :integer       not null
#  empresa_id :integer       not null
#  removido   :boolean       not null
#  created_at :datetime      
#  updated_at :datetime      
#

class UsuarioPerfil < ActiveRecord::Base
  #Relationships
  belongs_to :usuario
  belongs_to :empresa
  
  #Validations
  validates_presence_of :removido
  validates_associated :usuario
  validates_associated :empresa
  
end
