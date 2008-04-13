require File.dirname(__FILE__) + '/../test_helper'
require 'perfil'
class PerfilTest < ActiveSupport::TestCase
   fixtures :perfis
   
  # Replace this with your real tests.
  def test_uniqueness
    perf = Perfil.new
    perf.nome = 'Perfil Teste'
    assert !perf.valid?
    assert perf.errors['nome']
  end

  def test_save
    perf = Perfil.new
    perf.nome = 'Perfil Teste2'
    assert perf.save
  end
end
