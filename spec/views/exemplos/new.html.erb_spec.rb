require File.dirname(__FILE__) + '/../../spec_helper'

describe "/exemplos/new.html.erb" do
  include ExemplosHelper
  
  before(:each) do
    @exemplo = mock_model(Exemplo)
    @exemplo.stub!(:new_record?).and_return(true)
    @exemplo.stub!(:nome).and_return("MyString")
    @exemplo.stub!(:descricao).and_return("MyText")
    assigns[:exemplo] = @exemplo
  end

  it "should render new form" do
    render "/exemplos/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", exemplos_path) do
      with_tag("input#exemplo_nome[name=?]", "exemplo[nome]")
      with_tag("textarea#exemplo_descricao[name=?]", "exemplo[descricao]")
    end
  end
end


