# == Schema Information
# Schema version: 20080412162147
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
   validates_associated :usuario
   validates_associated :empresa
end
