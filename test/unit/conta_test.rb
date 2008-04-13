require File.dirname(__FILE__) + '/../test_helper'
require 'cliente'
require 'empresa'
require 'conta'
require 'lancamento'
require 'tipo_documento'
require 'tipo_conta'

class ContaTest < ActiveSupport::TestCase
   fixtures :clientes, :empresas, :contas, :tipo_documentos, :tipo_contas, :usuarios
#  cliente_id        :integer       
#  empresa_id        :integer       not null
#  origem_id         :integer       
#  destino_id        :integer       
#  grupo_id          :integer       
#  data              :datetime      not null
#  tipo_documento_id :integer       
#  removido          :boolean       not null
#  created_at        :datetime      
#  updated_at        :datetime      
#  valor             :decimal(, )   
#  realizacao_id     :integer       
#  numero_parcela    :integer       
  def test_transferencia
    origem = Conta.create(:nome => 'Origem', :tipo_conta => TipoConta.find(:first))
    destino = Conta.create(:nome => 'Destino', :tipo_conta => TipoConta.find(:last))
    lanc = origem.transferir(destino,:empresa => Empresa.find(:first), :data => Time.now, :tipo_documento => TipoDocumento.find(:first), :valor => 200)
    assert lanc
    assert_same lanc.origem.id, origem.id
    assert_same lanc.destino.id, destino.id
  end

  def test_sumarizacao
    assert Usuario.login('teste', 'teste')
    conta = Conta.new(:nome => 'ToTestSumary', :tipo_conta => TipoConta.find(:first))
    conta.save!
    lanc = Lancamento.new(:origem => conta, :empresa => Empresa.find(:first), :data => Time.now, :tipo_documento => TipoDocumento.find(:first), :valor => 200)
    lanc.save!
    lanc = Lancamento.new(:origem => conta, :empresa => Empresa.find(:first), :data => Time.now, :tipo_documento => TipoDocumento.find(:first), :valor => 250)
    lanc.save!
    lanc = Lancamento.new(:destino => conta, :empresa => Empresa.find(:first), :data => Time.now, :tipo_documento => TipoDocumento.find(:first), :valor => 300)
    lanc.save!
    sum = conta.sumarizar
    assert sum
    assert sum.valor == -150
    lanc = Lancamento.new(:origem => conta, :empresa => Empresa.find(:first), :data => Time.now, :tipo_documento => TipoDocumento.find(:first), :valor => 250)
    lanc.save!
    lanc = Lancamento.new(:destino => conta, :empresa => Empresa.find(:first), :data => Time.now, :tipo_documento => TipoDocumento.find(:first), :valor => 100)
    sum = conta.sumarizar
    assert sum.valor
    assert sum.valor == -400
  end
end
