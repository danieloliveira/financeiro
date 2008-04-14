require File.dirname(__FILE__) + '/../../spec_helper'

describe "/exemplos/show.html.erb" do
  include ExemplosHelper
  
  before(:each) do
    @exemplo = mock_model(Exemplo)
    @exemplo.stub!(:nome).and_return("MyString")
    @exemplo.stub!(:descricao).and_return("MyText")

    assigns[:exemplo] = @exemplo
  end

  it "should render attributes in <p>" do
    render "/exemplos/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
  end
end

