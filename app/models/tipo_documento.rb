# == Schema Information
# Schema version: 20080412171520
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
   validates_presence_of :nome
   validates_uniqueness_of :nome
   validates_length_of :nome, :maximum => 255, :allow_nil => true
end
