# == Schema Information
# Schema version: 20080412171520
#
# Table name: contas
#
#  id            :integer       not null, primary key
#  empresa_id    :integer       
#  conta_id      :integer       
#  tipo_conta_id :integer       not null
#  removido      :boolean       not null
#  created_at    :datetime      
#  updated_at    :datetime      
#

class Conta < ActiveRecord::Base
   #Relationships
   belongs_to :empresa
   belongs_to :conta
   belongs_to :tipo_conta
   has_many :contas
   has_many :sumarizacao_contas
   has_many :entradas, :class_name => 'Lancamento', :foreign_key => 'destino_id'
   has_many :saidas, :class_name => 'Lancamento', :foreign_key => 'entrada_id'

   #Validations
   validates_presence_of :removido
   validates_associated :empresa, :allow_nil => true
   validates_associated :conta, :allow_nil => true
   validates_associated :tipo_conta, :allow_nil => true

   #implementation
=begin
Transferência entre duas contas
O parâmetro opções recebe todos os parâmetros para um novo lançamento exceto origem e destino
=end
   def transferir(destino,opcoes)
      l = Lancamento.new(opcoes)
      l.attributes = opcoes
      l.origem = self
      l.destino = destino
      l.save!
   end
=begin
Cria um registro de fechamento de conta
=end
   def sumarizar
      last_sum = SumarizacaoConta.find(:last, :conditions => ['data < ?', Time.now])
      if last_sum
         since = last_sum.data
         total = last_sum.valor
      else
         since = 100.years.ago #FIXME isto vai causar problemas daqui a 100 anos, e tudo para colocar um if a menos no código
         total = 0
      end
      creditos = Lancamento.find(:all, :conditions => ["destino_id = ? and data > ?", self.id, since])
      debitos = Lancamento.find(:all, :conditions => ["origem_id = ? and data > ?", self.id, since])
      valor_credito = creditos.inject(0){|memo,lanc| memo + lanc.valor}
      valor_debito = debitos.inject(0){|memo,lanc| memo + lanc.valor}
      total = total + valor_credito - valor_debito
      sum = SumarizacaoConta.new
      sum.conta = self
      sum.valor = total
      sum.data = Time.now
      sum.save!
   end
end
