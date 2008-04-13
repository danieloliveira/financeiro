# == Schema Information
# Schema version: 20080412190825
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
#  nome          :string(255)   default(""), not null
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
      l
   end
=begin
Cria um registro de fechamento de conta
=end
   def sumarizar
      last_sum = SumarizacaoConta.find(:last, :conditions => ['data < ? and conta_id = ?', Time.now, self.id])
      if last_sum
         since = last_sum.data
         total = last_sum.valor
      else
         since = 100.years.ago #FIXME isto vai causar problemas daqui a 100 anos, e tudo para colocar um if a menos no código
         total = 0
      end
      creditos = Lancamento.find(:all, :conditions => ["destino_id = ? and data > ?", self.id, since])
      debitos = Lancamento.find(:all, :conditions => ["origem_id = ? and data > ?", self.id, since])
      valor_credito = creditos.inject(0){|memo,l| memo + l.valor}
      valor_debito = debitos.inject(0){|memo,l| memo + l.valor}
      total = total + valor_credito - valor_debito
      sum = SumarizacaoConta.new
      sum.conta = self
      sum.valor = total
      sum.usuario = Usuario.usuario_logado
      sum.data = Time.now
      sum.save!
      sum
   end
end
