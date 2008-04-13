# == Schema Information
# Schema version: 20080412190825
#
# Table name: sumarizacao_contas
#
#  id         :integer       not null, primary key
#  conta_id   :integer       not null
#  usuario_id :integer       not null
#  data       :datetime      not null
#  removido   :boolean       not null
#  created_at :datetime      
#  updated_at :datetime      
#  valor      :decimal(, )   
#

class SumarizacaoConta < ActiveRecord::Base
   usar_como_dinheiro :valor
   
   #Relationships
   belongs_to :conta
   belongs_to :usuario

   #Validations
   validates_presence_of :data, :valor
end
