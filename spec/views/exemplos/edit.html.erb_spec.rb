require File.dirname(__FILE__) + '/../../spec_helper'

describe "/exemplos/edit.html.erb" do
  include ExemplosHelper
  
  before do
    @exemplo = mock_model(Exemplo)
    @exemplo.stub!(:nome).and_return("MyString")
    @exemplo.stub!(:descricao).and_return("MyText")
    assigns[:exemplo] = @exemplo
  end

  it "should render edit form" do
    render "/exemplos/edit.html.erb"
    
    response.should have_tag("form[action=#{exemplo_path(@exemplo)}][method=post]") do
      with_tag('input#exemplo_nome[name=?]', "exemplo[nome]")
      with_tag('textarea#exemplo_descricao[name=?]', "exemplo[descricao]")
    end
  end
end


