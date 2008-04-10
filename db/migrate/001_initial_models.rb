class InitialModels < ActiveRecord::Migration
  def self.up
    create_table :empresas do |t|
      t.string :nome, :null => false, :unique => true, :length => 120
      t.boolean :removido, :null => false, :default => false
      t.timestamps
    end
    create_table :usuarios do |t|
      t.string :nome, :null => false, :unique => true, :length => 120
      t.string :senha, :null => false, :length => 120
      t.string :email, :null => false, :length => 250
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
      t.boolean :removido, :null => false, :default => false
      t.timestamps
    end
    create_table :tipo_contas do |t|
      t.string :nome, :null => false, :unique => true
      t.boolean :debito, :null => false, :default => false #se débito for false a conta é do tipo crédito, por exemplo, caixa é um tipo de conta crédito em um sistema financeiro, e "Despesas alunos" é um tipo de conta débito, um lançamento em uma conta débito é menos dinheiro em caixa
      t.boolean :removido, :null => false, :default => false
      t.timestamps
    end
    #contas como caixa, conta em banco, cartão de crédito, ...
    create_table :contas do |t|
      t.belongs_to :empresa
      t.belongs_to :conta #conta pai, para hierarquia de contas
      t.belongs_to :tipo_conta, :null => false
      t.boolean :removido, :null => false, :default => false
      t.timestamps
    end
    #lançamentos dde crédito e débito futuros
    create_table :previsoes do |t|
      t.date :inicio, :null => false
      t.integer :tipo, :null => false, :default => 0 #0= diário, 1= semanal, 2= mensal, 3= anual
      t.integer :periodo, :null => false, :default => 1 #tipo X periodo = intervalo (tipo semanal, periodo 2 = 2 semanas)
      t.date :fim, :null => true
      t.string :nome, :null => false
      t.text :descricao
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
    create_table :lancamento do |t|
      t.belongs_to :cliente, :null => true
      t.belongs_to :empresa, :null => false
      t.belongs_to :origem #conta origem
      t.belongs_to :destino #conta destino
      t.belongs_to :grupo #lançamentos agrupados
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
    drop_table :lancamento
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
