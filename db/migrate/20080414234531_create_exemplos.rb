class CreateExemplos < ActiveRecord::Migration
  def self.up
    create_table :exemplos do |t|
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :exemplos
  end
end
