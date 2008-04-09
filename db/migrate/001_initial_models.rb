class InitialModels < ActiveRecord::Migration
  def self.up
    create_table :empresas do |t|
      t.string :nome, :null => false, :unique => true, :length => 120
      t.timestamps!
    end
    create_table :usuarios do |t|
      t.string :nome, :null => false, :unique => true, :length => 120
      t.string :senha, :null => false, :length => 120
      t.string :email, :null => false, :length => 250
      t.timestamps!
    end
    create_table :usuario_empresas do |t|
      t.belongs_to :usuario, :null => false
      t.belongs_to :empresa, :null => false
      t.timestamps!
    end
    create_table :perfis do |t|
      t.string :nome, :null => false, :unique => true, :length => 30
      t.timestamps!
    end
    create_table :usuario_perfis do |t|
      t.belongs_to :usuario, :null => false
      t.belongs_to :empresa, :null => false
      t.timestamps!
    end
    create_table :cliente do |t|
      t.string :nome, :null => false
    end
  end

  def self.down
  end
end
