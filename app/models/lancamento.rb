# == Schema Information
# Schema version: 20080412190825
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

   #Validations
   validates_presence_of :data


   def extornar()
      extorno = clone
      extorno.valor = extorno.valor * -1
      extorno.grupo = self
      extorno.save!
   end

end
