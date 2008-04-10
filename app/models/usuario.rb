# == Schema Information
# Schema version: 20080410155917
#
# Table name: usuarios
#
#  id         :integer       not null, primary key
#  nome       :string(255)   not null
#  senha      :string(255)   not null
#  email      :string(255)   not null
#  removido   :boolean       not null
#  created_at :datetime      
#  updated_at :datetime      
#

class Usuario < ActiveRecord::Base
  #Relationships
  has_many :sumarizacao_contas
  has_many :usuario_empresas
  has_many :empresas, :through => :usuario_empresas
  has_many :usuario_perfis
  has_many :perfis, :through => :usuario_perfis

  
  #Validations
  validates_presence_of :nome, :senha, :email, :removido
  validates_uniqueness_of :nome
  validates_length_of :nome, :maximum => 255, :allow_nil => true
  validates_length_of :email, :maximum => 255, :allow_nil => true
  validates_length_of :senha, :maximum => 255, :allow_nil => true
end
