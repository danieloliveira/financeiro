require File.dirname(__FILE__) + '/../test_helper'

require 'usuario'

class UsuarioTest < ActiveSupport::TestCase
   fixtures :usuarios
  # Replace this with your real tests.
  def test_login
    assert_not_nil Usuario.login('teste','teste')
    assert_not_nil Usuario.usuario_logado
  end

  def test_uniqueness_of_name
    usuario = Usuario.new
    usuario.nome = 'teste'
    assert !usuario.valid?
    assert usuario.errors[:nome]
  end
  
  def test_validate_presence
     usuario = Usuario.new 
     assert !usuario.valid?
     assert usuario.errors[:nome]
     assert usuario.errors[:senha]
     assert usuario.errors[:email]
  end
  
  def test_validate_length
     usuario = Usuario.new
     usuario.nome = "a" * 500
     usuario.email = "a" * 500
     usuario.senha = "a" * 500
     assert !usuario.valid?
     assert usuario.errors[:nome]
     assert usuario.errors[:senha]
     assert usuario.errors[:email]
  end
  
  def test_save
     usuario = Usuario.new
     usuario.email = 'teste@teste.com'
     usuario.nome = 'teste2'
     usuario.senha = 'teste2'
     assert usuario.valid?
     assert usuario.save!
  end
end
