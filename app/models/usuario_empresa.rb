# == Schema Information
# Schema version: 20080412171520
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

end
