require File.dirname(__FILE__) + '/../test_helper'
require 'previsao'
require 'realizacao'
require 'lancamento'
require 'tipo_documento'

class LancamentoTest < ActiveSupport::TestCase
   fixtures :contas, :usuarios, :previsoes, :tipo_documentos, :empresas
  # Replace this with your real tests.
  def test_extorno
      prev = Previsao.find :first
      real = prev.realizar(:tipo_documento => TipoDocumento.find(:first))
      lanc = Lancamento.find :first
      lanc.extornar
      lancamentos = Lancamento.find(:all)
      assert lancamentos.size==2
      assert lancamentos.inject(0){|memo,lanc| memo + lanc.valor} == 0
  end

end
