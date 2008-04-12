require File.dirname(__FILE__) + '/../test_helper'
require 'tipo_documento'

class TipoDocumentoTest < ActiveSupport::TestCase
   fixtures :tipo_documentos
   
  # Replace this with your real tests.
   def test_validate_length
      td = TipoDocumento.new
      td.nome = "a" * 500
      assert !td.valid?
      assert td.errors[:nome]
   end
   def test_validate_presence
      td = TipoDocumento.new
      assert !td.valid?
      assert td.errors[:nome]
   end
   def test_validate_uniqueness
      td = TipoDocumento.new
      td.nome = "Cheque"
      assert !td.valid?
      assert td.errors[:nome]
   end
   
   def test_save
      td = TipoDocumento.new
      td.nome = "Cheque Nominal"
      assert td.valid?
      assert td.save
   end
end
