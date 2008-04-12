# == Schema Information
# Schema version: 20080412162147
#
# Table name: previsoes
#
#  id             :integer       not null, primary key
#  inicio         :date          not null
#  tipo           :integer       default(0), not null
#  periodo        :integer       default(1), not null
#  nome           :string(255)   not null
#  descricao      :text          
#  removido       :boolean       not null
#  created_at     :datetime      
#  updated_at     :datetime      
#  cliente_id     :integer       
#  numero_parcela :integer       
#  valor          :decimal(, )   
#  empresa_id     :integer       default(0), not null
#  usuario_id     :integer       default(0), not null
#  origem_id      :integer       default(0), not null
#  destino_id     :integer       default(0), not null
#

class Previsao < ActiveRecord::Base
   usar_como_dinheiro :valor
   #Relationships
   has_many :realizacoes
   has_many :lancamentos, :through => :realizacoes
   belongs_to :cliente
   belongs_to :empresa
   belongs_to :usuario
   belongs_to :origem, :class_name => 'Conta'
   belongs_to :destino, :class_name => 'Conta'

   #Validations
   validates_presence_of :inicio, :tipo, :periodo, :nome, :removido
   validates_numericality_of :tipo, :periodo, :allow_nil => true
   validates_length_of :nome, :maximum => 255, :allow_nil => true

   def realizar(opcoes)
      if opcoes.is_a? Hash
         transaction do
            data = opcoes.delete(:data) | Time.now
            val = opcoes.delete(:valor) | self.valor
            td = opcoes.delete(:tipo_documento)
            real = Realizacao.new
            real.valor_previsto = self.valor
            real.valor_realizado = val
            real.valor_desconto = self.valor - val
            real.previsao = this
            real.save!
            if opcoes[:parcelas]
               parcelas = opcoes.delete(:parcelas)
               valores = val.reais.parcelar(parcelas)
               valores.each_with_index do |v,idx|
                  lan = criar_lancamento(real,data)
                  lan.data = data + idx.month
                  lan.valor = v
                  if td.is_a? Array 
                     lan.tipo_documento = td[idx]
                  else
                     lan.tipo_documento = td
                  end
                  lan.numero_parcela = idx+1
                  lan.save!
               end
            else
               lan = criar_lancamento(real,data)
               lan.data = data
               lan.valor = val
               lan.tipo_documento = td
               lan.save!
            end
            real
         end
      end
   end
   
   private
      def criar_lancamento(real,data)
            lan = Lancamento.new
            lan.cliente = self.cliente
            lan.empresa = self.empresa
            lan.origem = self.origem
            lan.destino = self.destino
            lan.data = data
            lan.realizacao = real
      end

end
