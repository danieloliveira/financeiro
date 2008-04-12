require File.dirname(__FILE__) + '/../test_helper'
require 'tipo_conta'

class TipoContaTest < ActiveSupport::TestCase
   fixtures :tipo_contas
   
  # Replace this with your real tests.
   def test_validate_length
      td = TipoConta.new
      td.nome = "a" * 500
      assert !td.valid?
      assert td.errors[:nome]
   end
   def test_validate_presence
      td = TipoConta.new
      assert !td.valid?
      assert td.errors[:nome]
   end
   def test_validate_uniqueness
      td = TipoConta.new
      td.nome = "Investimentos"
      assert !td.valid?
      assert td.errors[:nome]
   end
   
   def test_save
      td = TipoConta.new
      td.nome = "Cheque Nominal"
      assert td.valid?
      assert td.save
   end
end
