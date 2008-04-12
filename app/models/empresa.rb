# == Schema Information
# Schema version: 20080411000613
#
# Table name: empresas
#
#  id         :integer       not null, primary key
#  nome       :string(255)   not null
#  removido   :boolean       not null
#  created_at :datetime      
#  updated_at :datetime      
#

class Empresa < ActiveRecord::Base
  #Relationships
  has_many :clientes
  has_many :contas
  has_many :lancamentos
  has_many :usuario_empresas
  has_many :usuarios, :through => :usuario_empresas

  
  #Validations
  validates_presence_of :nome, :removido
  validates_uniqueness_of :nome 
  validates_length_of :nome, :maximum => 255, :allow_nil => true
  
  #Implementation
=begin
Este método retorna a empresa selecionada para o usuário no momento
=end
  def self.empresa_selecionada
    @@empresa_selecionada
  end
  def self.empresa_selecionada=(valor)
    @@empresa_selecionada = valor
  end
end
