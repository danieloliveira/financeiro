# == Schema Information
# Schema version: 20080411000613
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
  has_many :entradas, :class_name => 'Lancamento', :foreign_key => 'destino_id'
  has_many :saidas, :class_name => 'Lancamento', :foreign_key => 'entrada_id'
  
  #Validations
  validates_presence_of :removido
  validates_associated :empresa, :allow_nil => true 
  validates_associated :conta, :allow_nil => true 
  validates_associated :tipo_conta, :allow_nil => true 
  
  #implementation
=begin
Transferência entre duas contas
O parâmetro opções recebe todos os parâmetros para um novo lançamento exceto origem e destino
=end
  def transferir(destino,opcoes)
    l = Lancamento.new(opcoes)
    l.attributes = opcoes
    l.origem = self
    l.destino = destino
    l.save!
  end
end
