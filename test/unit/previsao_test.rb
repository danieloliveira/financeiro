require File.dirname(__FILE__) + '/../test_helper'
require 'previsao'
require 'realizacao'
require 'lancamento'
require 'tipo_documento'

class PrevisaoTest < ActiveSupport::TestCase
   fixtures :contas, :usuarios, :previsoes, :tipo_documentos, :empresas
  # Replace this with your real tests.
   def test_realizacao_simples
      prev = Previsao.find :first
      real = prev.realizar(:tipo_documento => TipoDocumento.find(:first))
      assert real
      assert real.lancamentos.size == 1
      assert real.valor_realizado == prev.valor
      assert real.lancamentos[0].valor = prev.valor
   end
   
   def test_realizacao_parcelada
      prev = Previsao.find :first
      real = prev.realizar(:tipo_documento => TipoDocumento.find(:first), :parcelas => 3)
      assert real
      assert real.lancamentos.size == 3
      assert real.valor_realizado == prev.valor
      assert real.lancamentos.inject(0){|memo,lanc| memo + lanc.valor} == prev.valor
   end
   
   def test_realizacao_parcelada_multi_tipo
      prev = Previsao.find :first
      real = prev.realizar(:tipo_documento => TipoDocumento.find(:all), :parcelas => 3)
      assert real
      assert real.lancamentos.size == 3
      assert real.valor_realizado == prev.valor
      assert real.lancamentos.inject(0){|memo,lanc| memo + lanc.valor} == prev.valor
      assert_not_same real.lancamentos[0].tipo_documento,real.lancamentos[1].tipo_documento
   end
end
