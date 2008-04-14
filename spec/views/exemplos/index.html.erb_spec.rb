require File.dirname(__FILE__) + '/../../spec_helper'

describe "/exemplos/index.html.erb" do
  include ExemplosHelper
  
  before(:each) do
    exemplo_98 = mock_model(Exemplo)
    exemplo_98.should_receive(:nome).and_return("MyString")
    exemplo_98.should_receive(:descricao).and_return("MyText")
    exemplo_99 = mock_model(Exemplo)
    exemplo_99.should_receive(:nome).and_return("MyString")
    exemplo_99.should_receive(:descricao).and_return("MyText")

    assigns[:exemplos] = [exemplo_98, exemplo_99]
  end

  it "should render list of exemplos" do
    render "/exemplos/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
  end
end

