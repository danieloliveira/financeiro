require File.dirname(__FILE__) + '/../test_helper'

require 'usuario_perfil'
require 'usuario'
require 'perfil'

class UsuarioPerfilTest < ActiveSupport::TestCase
   fixtures :usuarios, :perfis, :usuario_perfis
   
  # Replace this with your real tests.
   def test_creation
      up = UsuarioPerfil.new
      up.usuario = Usuario.find :first
      up.perfil = Perfil.find :first
      assert up.save
   end

  
end
