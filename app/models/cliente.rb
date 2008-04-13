# == Schema Information
# Schema version: 20080412190825
#
# Table name: clientes
#
#  id         :integer       not null, primary key
#  nome       :string(255)   not null
#  empresa_id :integer       not null
#  removido   :boolean       not null
#  created_at :datetime      
#  updated_at :datetime      
#

class Cliente < ActiveRecord::Base
   #Relationships
   belongs_to :empresa
   has_many :lancamentos


   #Validations
   validates_presence_of :nome, :removido
   validates_uniqueness_of :nome
   validates_length_of :nome, :maximum => 255, :allow_nil => true
   validates_associated :empresa, :allow_nil => true

   def parcelar(valor,vezes,data_inicio,descricao)
      valor_parcelas = valor.reais.parcelar(vezes)
      data_parcela = data_inicio
      transaction do
         valor_parcelas.each_with_index do |p,idx|
            parcela = Previsao.new
            parcela.cliente = self
            parcela.valor = p
            parcela.inicio = data_parcela
            data_parcela = data_parcela + 1.month
            parcela.nome = descricao
            parcela.numero_parcela = idx
            parcela.save!
         end
      end
   end
end
