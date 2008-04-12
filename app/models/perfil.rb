# == Schema Information
# Schema version: 20080412162147
#
# Table name: perfis
#
#  id         :integer       not null, primary key
#  nome       :string(255)   not null
#  removido   :boolean       not null
#  created_at :datetime      
#  updated_at :datetime      
#

class Perfil < ActiveRecord::Base
   #Relationships
   has_many :usuarios, :through => :usuario_perfis
   has_many :usuario_perfis

   #Validations
   validates_presence_of :nome, :removido
   validates_uniqueness_of :nome
   validates_length_of :nome, :maximum => 255, :allow_nil => true
end
