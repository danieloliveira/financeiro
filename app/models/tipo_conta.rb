# == Schema Information
# Schema version: 20080412162147
#
# Table name: tipo_contas
#
#  id                       :integer       not null, primary key
#  nome                     :string(255)   not null
#  debito                   :boolean       not null
#  removido                 :boolean       not null
#  created_at               :datetime      
#  updated_at               :datetime      
#  lancamento_padrao_debito :boolean       not null
#

class TipoConta < ActiveRecord::Base
   #Relationships
   has_many :contas

   #Validations
   validates_presence_of :nome, :debito, :removido
   validates_uniqueness_of :nome
   validates_length_of :nome, :maximum => 255, :allow_nil => true
end
