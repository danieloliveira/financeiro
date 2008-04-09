class InitialModels < ActiveRecord::Migration
  def self.up
    create_table :empresas do |t|
      
    end
    create_table :usuarios do |t|
    end
    create_table :direito_gerenciamentos do |t|
      t.belongs_to :usuarios
      t.belongs_to :empresass
    end
  end

  def self.down
  end
end
