require File.dirname(__FILE__) + '/../test_helper'

require 'usuario'
require 'empresa'
require 'usuario_empresa'

class UsuarioEmpresaTest < ActiveSupport::TestCase
   fixtures :usuarios, :empresas
  # Replace this with your real tests.
  def test_save
    ue = UsuarioEmpresa.new
    ue.usuario = Usuario.find :first
    ue.empresa = Empresa.find :first
    assert ue.save
  end

end
