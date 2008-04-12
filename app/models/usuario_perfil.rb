# == Schema Information
# Schema version: 20080412171520
#
# Table name: usuario_perfis
#
#  id         :integer       not null, primary key
#  usuario_id :integer       not null
#  perfil_id  :integer       not null
#  removido   :boolean       not null
#  created_at :datetime      
#  updated_at :datetime      
#

class UsuarioPerfil < ActiveRecord::Base
   #Relationships
   belongs_to :usuario
   belongs_to :perfil

end
