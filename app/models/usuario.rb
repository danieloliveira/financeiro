# == Schema Information
# Schema version: 20080412162147
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

   #Implementation
=begin
  Este método retorna o usuário atual do sistema
=end
   def self.usuario_logado
      @@usuario_logado
   end
   def self.usuario_logado=(value)
      @@usuario_logado=value
   end

=begin
Método de login
=end
   def self.login(login,senha)
      @@usuario_logado
      u = Usuario.find_by_nome(login)
      @@usuario_logado = u if u && u.senha == senha
   end
end
