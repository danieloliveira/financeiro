# == Schema Information
# Schema version: 20080412190825
#
# Table name: clientes
#
#  id         :integer       not null, primary key
#  nome       :string(255)   not null
#  empresa_id :integer       not null
#  removido   :boolean       not null
#  created_at :datetime      
#  updated_at :datetime      
#

class Cliente < ActiveRecord::Base
   #Relationships
   belongs_to :empresa
   has_many :lancamentos


   #Validations
   validates_presence_of :nome, :removido
   validates_uniqueness_of :nome
   validates_length_of :nome, :maximum => 255, :allow_nil => true
   validates_associated :empresa, :allow_nil => true

end
