# == Schema Information
# Schema version: 20080412171520
#
# Table name: lancamentos
#
#  id                :integer       not null, primary key
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
#

class Lancamento < ActiveRecord::Base
   usar_como_dinheiro :valor

   #Relationships
   belongs_to :cliente
   belongs_to :empresa
   belongs_to :origem, :class_name => 'Conta'
   belongs_to :destino, :class_name => 'Conta'
   belongs_to :grupo, :class_name => 'Lancamento'
   belongs_to :realizacao
   belongs_to :tipo_documento
   has_many :realizacao

   #Validations
   validates_presence_of :data, :removido
   validates_associated :cliente, :allow_nil => true
   validates_associated :empresa, :allow_nil => true
   validates_associated :origem, :allow_nil => true
   validates_associated :destino, :allow_nil => true
   validates_associated :grupo, :allow_nil => true
   validates_associated :previsao, :allow_nil => true
   validates_associated :tipo_documento, :allow_nil => true


   def extornar()
      extorno = Lancamento.new
      extorno.attributes = attributes
      extorno.valor = extorno.valor * -1
      extorno.grupo = self
      extornar.save!
   end

end
