=begin
No modelo abaixo, nao ficou claro como ele podera suportar os casos explicados no documento.
Tambem nao tem informacao sobre as parcelas, me dizendo seu numero, tipo 1/6, 2/6 ... 5/6, 6/6
Quando alguem comprar algo e parcelar em 6 vezes, sera gerado 6 parcelas, ou sera gerado uma apenas com recorrencia mensal ?
Se for o segundo caso, como seria feito por exemplo o parcelamento de 100 reais em 3 vezes, 
onde a primeira parcela eh 33.34 e as outras duas de 33.33 ?
Para me ajudar a entender, me faca um exemplo com models, algo assim:
parcelas = parcelar(:valor => 100.00, :vezes => 3)
cliente.inserir_parcelas(parcelas)
# o exemplo acima eh totalmente ficticio, peguei um exemplo do Brazilian Rails, que tem um metodo para parcelar um valor.
# mas gostaria que fizesse algo assim para deixar claro como as entidades se relacionam.

Pode adicionar tambem o controle de cheques e pre-datados. Vc sabe como controlar cartao de credito?
Vou pegar o meu caso, pois este sistema tambem sera usado por mim.
Tenho cartao visa e master, mas os dois sao apenas duas bandeiras para a mesma conta. Meu limite nesta conta eh 900 +-
No dia 10 de todo mes, como configurei debito automatico, sai o dinheiro da minha conta no banco para cobrir os gastos no limite do cartao.
Entao de acordo que vou gastando durante o mes, o meu credito de 900 vai caindo, e volta ah 900 no dia 10 do proximo mes.

Tambem nao entendi como receber um pagamento, dando um desconto para o cliente, 
o que eh muito comum, mas de uma maneira que eu possa por exemplo tirar um relatorio dos descontos. O mesmo para acrescimos, tipo juros, etc.

Tambem ainda nao vi onde entra extorno. 

Vamos acelerar pois temos soh ateh domingo.

=end
class InitialModels < ActiveRecord::Migration
  def self.up
    create_table :empresas do |t|
      t.string :nome, :null => false, :unique => true, :length => 120
			# adicionar informacao com o fuso horario desta empresa
      t.boolean :removido, :null => false, :default => false
      t.timestamps
    end
    create_table :usuarios do |t|
      t.string :nome, :null => false, :unique => true, :length => 120
      t.string :senha, :null => false, :length => 120
      t.string :email, :null => false, :length => 250
			# gostaria que o usuario fosse implementado com o restfull_authentication, 
			# pois ja implementa esqueci senha, ativacao por email, etc
			# ou algo semelhante
      t.boolean :removido, :null => false, :default => false
      t.timestamps
    end
    create_table :usuario_empresas do |t|
      t.belongs_to :usuario, :null => false
      t.belongs_to :empresa, :null => false
      t.boolean :removido, :null => false, :default => false
      t.timestamps
    end
    create_table :perfis do |t|
      t.string :nome, :null => false, :unique => true, :length => 30
      t.boolean :removido, :null => false, :default => false
      t.timestamps
    end
    create_table :usuario_perfis do |t|
      t.belongs_to :usuario, :null => false
      t.belongs_to :empresa, :null => false
      t.boolean :removido, :null => false, :default => false
      t.timestamps
    end
    create_table :clientes do |t|
      t.string :nome, :null => false
			t.belongs_to :empresa, :null => false # acho que aqui faltou dizer de qual empresa o cliente pertence.
      t.boolean :removido, :null => false, :default => false
      t.timestamps
    end
    create_table :tipo_contas do |t|
      t.string :nome, :null => false, :unique => true
      t.boolean :debito, :null => false, :default => false #se débito for false a conta é do tipo crédito, por exemplo, caixa é um tipo de conta crédito em um sistema financeiro, e "Despesas alunos" é um tipo de conta débito, um lançamento em uma conta débito é menos dinheiro em caixa
			# me explique sua definicao de conta. Parece que tipo_contas no seu vocabulario eh plano_contas no meu. Seria aqui que entraria supermercado, impostos, etc?
      t.boolean :removido, :null => false, :default => false
      t.timestamps
    end
    #contas como caixa, conta em banco, cartão de crédito, ...
    create_table :contas do |t|
      t.belongs_to :empresa
      t.belongs_to :conta #conta pai, para hierarquia de contas
			# nao vi utilidade em hierarquia de contas, poderia me explicar como funciona?
      t.belongs_to :tipo_conta, :null => false
			# se a sua definicao de tipo_contas for igual a minha de plano_contas, nao entendi porque deste relacionamento acima.
      t.boolean :removido, :null => false, :default => false
      t.timestamps
    end
    #lançamentos dde crédito e débito futuros
    create_table :previsoes do |t|
      t.date :inicio, :null => false
			# algum motivo especial por o tipo ser numerico ao inves de uma string "verbose" ?
      t.integer :tipo, :null => false, :default => 0 #0= diário, 1= semanal, 2= mensal, 3= anual
			# para um pagamento a cada dois anos, seria tipo=3 e periodo=2 ?
      t.integer :periodo, :null => false, :default => 1 #tipo X periodo = intervalo (tipo semanal, periodo 2 = 2 semanas)
			# every beginning has an ending, neo? Com isto posso agendar um pagamento bimestral que comeca ano que vem e termina em 2010, eh isso?
      t.date :fim, :null => true
      t.string :nome, :null => false
      t.text :descricao
			# esta previsao nao deveria pertencer a uma empresa? 
			# e quanto ao usuario que criou-a? 
			# nao tem ligacao com cliente, fornecedor, plano de conta, conta, etc?
			# me ilumine!
      t.boolean :removido, :null => false, :default => false
      t.timestamps
    end
    create_table :tipo_documentos do |t|
       t.string :nome, :null => false, :unique => true
      t.boolean :removido, :null => false, :default => false
      t.timestamps
    end
    create_table :realizacoes do |t|
       t.belongs_to :previsao
       t.date :data
       t.belongs_to :lancamento
    end
    create_table :lancamentos do |t|
      t.belongs_to :cliente, :null => true
      t.belongs_to :empresa, :null => false
      t.belongs_to :origem #conta origem
      t.belongs_to :destino #conta destino
      t.belongs_to :grupo #lançamentos agrupados
      t.belongs_to :previsao
      t.date :data, :null => false # nao seria melhor saber a hora exata com um timestamp? ou isso seria trabalho para o created_at ?
      t.date :data, :null => false
      t.belongs_to :tipo_documento
      t.boolean :removido, :null => false, :default => false
      t.timestamps
    end
    #fechamento caixa, caixa é considerado uma conta, vai ser apenas uma sumarização de uma conta, o que também vai facilitar futuros relatórios
    create_table :sumarizacao_contas do |t|
      t.belongs_to :conta, :null => false
      t.belongs_to :usuario, :null => false
      t.date :data, :null => false
      t.boolean :removido, :null => false, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :sumarizacao_contas
    drop_table :lancamentos
    drop_table :tipo_documentos
    drop_table :previsoes
    drop_table :contas
    drop_table :tipo_contas
    drop_table :clientes
    drop_table :usuario_perfis
    drop_table :perfis
    drop_table :usuario_empresas
    drop_table :usuarios
    drop_table :empresas
  end
end
