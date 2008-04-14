require File.dirname(__FILE__) + '/../spec_helper'

describe ExemplosController do
  describe "handling GET /exemplos" do

    before(:each) do
      @exemplo = mock_model(Exemplo)
      Exemplo.stub!(:find).and_return([@exemplo])
    end
  
    def do_get
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should render index template" do
      do_get
      response.should render_template('index')
    end
  
    it "should find all exemplos" do
      Exemplo.should_receive(:find).with(:all).and_return([@exemplo])
      do_get
    end
  
    it "should assign the found exemplos for the view" do
      do_get
      assigns[:exemplos].should == [@exemplo]
    end
  end

  describe "handling GET /exemplos.xml" do

    before(:each) do
      @exemplo = mock_model(Exemplo, :to_xml => "XML")
      Exemplo.stub!(:find).and_return(@exemplo)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :index
    end
  
    it "should be successful" do
      do_get
      response.should be_success
    end

    it "should find all exemplos" do
      Exemplo.should_receive(:find).with(:all).and_return([@exemplo])
      do_get
    end
  
    it "should render the found exemplos as xml" do
      @exemplo.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /exemplos/1" do

    before(:each) do
      @exemplo = mock_model(Exemplo)
      Exemplo.stub!(:find).and_return(@exemplo)
    end
  
    def do_get
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render show template" do
      do_get
      response.should render_template('show')
    end
  
    it "should find the exemplo requested" do
      Exemplo.should_receive(:find).with("1").and_return(@exemplo)
      do_get
    end
  
    it "should assign the found exemplo for the view" do
      do_get
      assigns[:exemplo].should equal(@exemplo)
    end
  end

  describe "handling GET /exemplos/1.xml" do

    before(:each) do
      @exemplo = mock_model(Exemplo, :to_xml => "XML")
      Exemplo.stub!(:find).and_return(@exemplo)
    end
  
    def do_get
      @request.env["HTTP_ACCEPT"] = "application/xml"
      get :show, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should find the exemplo requested" do
      Exemplo.should_receive(:find).with("1").and_return(@exemplo)
      do_get
    end
  
    it "should render the found exemplo as xml" do
      @exemplo.should_receive(:to_xml).and_return("XML")
      do_get
      response.body.should == "XML"
    end
  end

  describe "handling GET /exemplos/new" do

    before(:each) do
      @exemplo = mock_model(Exemplo)
      Exemplo.stub!(:new).and_return(@exemplo)
    end
  
    def do_get
      get :new
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render new template" do
      do_get
      response.should render_template('new')
    end
  
    it "should create an new exemplo" do
      Exemplo.should_receive(:new).and_return(@exemplo)
      do_get
    end
  
    it "should not save the new exemplo" do
      @exemplo.should_not_receive(:save)
      do_get
    end
  
    it "should assign the new exemplo for the view" do
      do_get
      assigns[:exemplo].should equal(@exemplo)
    end
  end

  describe "handling GET /exemplos/1/edit" do

    before(:each) do
      @exemplo = mock_model(Exemplo)
      Exemplo.stub!(:find).and_return(@exemplo)
    end
  
    def do_get
      get :edit, :id => "1"
    end

    it "should be successful" do
      do_get
      response.should be_success
    end
  
    it "should render edit template" do
      do_get
      response.should render_template('edit')
    end
  
    it "should find the exemplo requested" do
      Exemplo.should_receive(:find).and_return(@exemplo)
      do_get
    end
  
    it "should assign the found Exemplo for the view" do
      do_get
      assigns[:exemplo].should equal(@exemplo)
    end
  end

  describe "handling POST /exemplos" do

    before(:each) do
      @exemplo = mock_model(Exemplo, :to_param => "1")
      Exemplo.stub!(:new).and_return(@exemplo)
    end
    
    describe "with successful save" do
  
      def do_post
        @exemplo.should_receive(:save).and_return(true)
        post :create, :exemplo => {}
      end
  
      it "should create a new exemplo" do
        Exemplo.should_receive(:new).with({}).and_return(@exemplo)
        do_post
      end

      it "should redirect to the new exemplo" do
        do_post
        response.should redirect_to(exemplo_url("1"))
      end
      
    end
    
    describe "with failed save" do

      def do_post
        @exemplo.should_receive(:save).and_return(false)
        post :create, :exemplo => {}
      end
  
      it "should re-render 'new'" do
        do_post
        response.should render_template('new')
      end
      
    end
  end

  describe "handling PUT /exemplos/1" do

    before(:each) do
      @exemplo = mock_model(Exemplo, :to_param => "1")
      Exemplo.stub!(:find).and_return(@exemplo)
    end
    
    describe "with successful update" do

      def do_put
        @exemplo.should_receive(:update_attributes).and_return(true)
        put :update, :id => "1"
      end

      it "should find the exemplo requested" do
        Exemplo.should_receive(:find).with("1").and_return(@exemplo)
        do_put
      end

      it "should update the found exemplo" do
        do_put
        assigns(:exemplo).should equal(@exemplo)
      end

      it "should assign the found exemplo for the view" do
        do_put
        assigns(:exemplo).should equal(@exemplo)
      end

      it "should redirect to the exemplo" do
        do_put
        response.should redirect_to(exemplo_url("1"))
      end

    end
    
    describe "with failed update" do

      def do_put
        @exemplo.should_receive(:update_attributes).and_return(false)
        put :update, :id => "1"
      end

      it "should re-render 'edit'" do
        do_put
        response.should render_template('edit')
      end

    end
  end

  describe "handling DELETE /exemplos/1" do

    before(:each) do
      @exemplo = mock_model(Exemplo, :destroy => true)
      Exemplo.stub!(:find).and_return(@exemplo)
    end
  
    def do_delete
      delete :destroy, :id => "1"
    end

    it "should find the exemplo requested" do
      Exemplo.should_receive(:find).with("1").and_return(@exemplo)
      do_delete
    end
  
    it "should call destroy on the found exemplo" do
      @exemplo.should_receive(:destroy)
      do_delete
    end
  
    it "should redirect to the exemplos list" do
      do_delete
      response.should redirect_to(exemplos_url)
    end
  end
end