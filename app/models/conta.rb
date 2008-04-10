# == Schema Information
# Schema version: 20080410155917
#
# Table name: contas
#
#  id            :integer       not null, primary key
#  empresa_id    :integer       
#  conta_id      :integer       
#  tipo_conta_id :integer       not null
#  removido      :boolean       not null
#  created_at    :datetime      
#  updated_at    :datetime      
#

class Conta < ActiveRecord::Base
  #Relationships
  belongs_to :empresa
  belongs_to :conta
  belongs_to :tipo_conta
  has_many :contas
  has_many :sumarizacao_contas
  
  #Validations
  validates_presence_of :removido
  validates_associated :empresa, :allow_nil => true 
  validates_associated :conta, :allow_nil => true 
  validates_associated :tipo_conta, :allow_nil => true 
end
