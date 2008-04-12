# == Schema Information
# Schema version: 20080411000613
#
# Table name: sumarizacao_contas
#
#  id         :integer       not null, primary key
#  conta_id   :integer       not null
#  usuario_id :integer       not null
#  data       :date          not null
#  removido   :boolean       not null
#  created_at :datetime      
#  updated_at :datetime      
#

class SumarizacaoConta < ActiveRecord::Base
  #Relationships
  belongs_to :conta
  belongs_to :usuario
  
  #Validations
  validates_presence_of :data, :removido
  validates_associated :conta, :allow_nil => true 
  validates_associated :usuario, :allow_nil => true 
end
